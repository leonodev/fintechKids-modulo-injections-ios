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
    
    private init() {
        storage = [:]
    }
    
    // MARK: - Registration Methods
    
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
        lock.lock()
        defer { lock.unlock() }
        guard let value = storage[ObjectIdentifier(type)] as? T else {
            fatalError("Dependency missing: \(type)")
        }
        return value
    }
    
    public func set<T>(_ value: T, for type: T.Type) {
        lock.lock()
        storage[ObjectIdentifier(type)] = value
        lock.unlock()
    }
    
//    /// Ayudante para activar la inferencia de tipos automática en los Getters por KeyPath.
//    public func get<T>() -> T {
//        get(T.self)
//    }
//    
//    /// Ayudante para activar la inferencia de tipos automática en los Setters por KeyPath.
//    public func set<T>(_ value: T) {
//        set(value, for: T.self)
//    }
    
    // MARK: - Internal Helpers for Swift 6 Async
    
    private func getSnapshot() -> [ObjectIdentifier: Any] {
        lock.lock()
        defer { lock.unlock() }
        return storage
    }
    
    private func restoreSnapshot(_ snapshot: [ObjectIdentifier: Any]) {
        lock.lock()
        storage = snapshot
        lock.unlock()
    }
    
    /// Scope temporal con snapshot/restore (ideal para aislar estados en tests o flujos específicos).
    public func withOverrides<R>(
        _ body: () async throws -> R
    ) async rethrows -> R {
        let snapshot = getSnapshot()
        
        defer {
            restoreSnapshot(snapshot)
        }
        
        return try await body()
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
