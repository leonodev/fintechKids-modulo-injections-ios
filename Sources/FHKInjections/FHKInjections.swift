// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import FHKDomain

public enum RuntimeEnvironment {
    case standard
    case preview
    case testing
    
    public static var current: RuntimeEnvironment {
#if DEBUG
        if NSClassFromString("XCTestCase") != nil {
            return .testing
        }
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return .preview
        }
        return .standard
#else
        return .standard
#endif
    }
}

public var inject: DependenciesInjection { .shared }

public final class DependenciesInjection: @unchecked Sendable {
    public static let shared = DependenciesInjection()
    
    private let lock = NSLock()
    private var storage: [ObjectIdentifier: Any] = [:]
    
    // MARK: - Override scoping (Swift Testing / concurrencia segura)
    
    /// Caja de overrides propia de cada árbol de tareas.
    /// Al ser una `class` con su propio lock, es mutable dentro del scope,
    /// pero al ser TaskLocal, nunca se comparte entre árboles hermanos.
    private final class OverrideBox: @unchecked Sendable {
        private let lock = NSLock()
        private var dict: [ObjectIdentifier: Any]
        
        init(_ dict: [ObjectIdentifier: Any]) {
            self.dict = dict
        }
        
        func get(_ id: ObjectIdentifier) -> Any? {
            lock.lock(); defer { lock.unlock() }
            return dict[id]
        }
        
        func set(_ id: ObjectIdentifier, _ value: Any) {
            lock.lock(); defer { lock.unlock() }
            dict[id] = value
        }
    }
    
    /// Almacenamiento task-local que contiene la caja de overrides activa, si existe.
    ///
    /// `nil` significa que no hay ningún scope de overrides activo: `get(_:)`
    /// recurre al diccionario `storage` global. Cuando se ejecuta `withOverrides(_:)`,
    /// se vincula una nueva `OverrideBox` a este task-local durante la duración
    /// de su closure de operación.
    ///
    /// Al ser un estado task-local (no global), el valor vinculado se hereda
    /// automáticamente en cualquier child task creado dentro de ese scope,
    /// pero es completamente invisible para árboles de tareas hermanos que
    /// se ejecuten en paralelo (por ejemplo, tests en paralelo con Swift Testing).
    /// Esto elimina las carreras entre tests sin necesidad de locking manual
    /// ni de snapshot/restore sobre estado compartido.
    @TaskLocal private static var overrideBox: OverrideBox?
    
    private init() {
        storage = [:]
    }
    
    // MARK: - Registration Methods (sin cambios)
    
    /// CASE 1: Registra una dependencia diferenciando los tres entornos posibles (App, Previews y Tests).
    public func register<T>(
        _ type: T.Type,
        standard: () -> T,
        preview: () -> T,
        testing: () -> T
    ) {
        let selectedValue: T
        switch RuntimeEnvironment.current {
        case .standard: selectedValue = standard()
        case .preview:  selectedValue = preview()
        case .testing:  selectedValue = testing()
        }
        set(selectedValue, for: type)
    }
    
    /// CASO 2: Registra una dependencia sin UI (usa la versión estándar en App y Previews, pero un Mock en Tests Unitarios).
    public func register<T>(
        _ type: T.Type,
        standard: () -> T,
        testing: () -> T
    ) {
        let selectedValue: T
        switch RuntimeEnvironment.current {
        case .standard, .preview: selectedValue = standard()
        case .testing:            selectedValue = testing()
        }
        set(selectedValue, for: type)
    }
    
    /// CASO 3: Registra una dependencia estática (usa exactamente la misma instancia real en absolutamente todos los entornos).
    public func register<T>(
        _ type: T.Type,
        standard: () -> T
    ) {
        let selectedValue = standard()
        set(selectedValue, for: type)
    }
    
    // MARK: - Core Methods (Safe Access)
    public func get<T>(_ type: T.Type) -> T {
        let id = ObjectIdentifier(type)
        
        // Si hay una caja de overrides activa en ESTE árbol de tareas, prioridad absoluta.
        if let box = Self.overrideBox, let value = box.get(id) as? T {
            return value
        }
        
        // Si no, comportamiento de siempre: storage global.
        lock.lock()
        defer { lock.unlock() }
        guard let value = storage[id] as? T else {
            fatalError("Dependency missing: \(type)")
        }
        return value
    }
    
    public func set<T>(_ value: T, for type: T.Type) {
        let id = ObjectIdentifier(type)
        
        // Si estamos dentro de un withOverrides, la escritura va a la caja local,
        // NUNCA al storage global. Esto es lo que elimina la carrera entre tests.
        if let box = Self.overrideBox {
            box.set(id, value)
            return
        }
        
        lock.lock()
        storage[id] = value
        lock.unlock()
    }
    
    private func snapshotStorage() -> [ObjectIdentifier: Any] {
        lock.lock()
        defer { lock.unlock() }
        return storage
    }
    
    // MARK: - Scope temporal (Swift Testing / XCTest async, sin fugas entre tests paralelos)
    
    /// Crea un scope aislado por árbol de tareas. Todo lo que se lea/escriba dentro
    /// de `body` (incluyendo child tasks estructurados creados dentro) usa esta caja.
    /// Tests hermanos ejecutándose en paralelo (Swift Testing) NUNCA la ven.
    public func withOverrides<R>(
        _ body: () async throws -> R
    ) async rethrows -> R {
        let baseline = snapshotStorage()
        
        let box = OverrideBox(baseline)
        return try await Self.$overrideBox.withValue(box, operation: body)
    }
    
    /// Acceso mediante KeyPath para @propertyWrapper y para Mocks en tests.
    /// Ejemplo: inject[\.splashRepository] = mock
    public subscript<T>(keyPath: KeyPath<DependenciesInjection, T>) -> T {
        get { self[keyPath: keyPath] }
        set { set(newValue, for: T.self) }
    }
}

@propertyWrapper
public struct Inject<T: Sendable> {
    private let keyPath: KeyPath<DependenciesInjection, T>
    
    public init(_ keyPath: KeyPath<DependenciesInjection, T>) {
        self.keyPath = keyPath
    }
    
    public var wrappedValue: T {
        DependenciesInjection.shared[keyPath]
    }
}
