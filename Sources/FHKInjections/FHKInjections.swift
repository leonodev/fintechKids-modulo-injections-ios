// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import FHKDomain

public var inject: DependenciesInjection { .shared }

public final class DependenciesInjection: @unchecked Sendable {
    public static let shared = DependenciesInjection()
    
    private let lock = NSLock()
    private var storage: [ObjectIdentifier: Any] = [:]
    
    private init() {
        storage = [:]
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
    
    //// Scope temporal con snapshot/restore (ideal tests/flows)
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
        set {
            // Aquí es donde ocurre la magia:
            // extraemos el tipo T del KeyPath y lo guardamos
            set(newValue, for: T.self)
        }
    }
}


//@propertyWrapper
//public struct Inject<T: Sendable> {
//    private let keyPath: KeyPath<DependenciesInjection, T>
//    
//    public init(_ keyPath: KeyPath<DependenciesInjection, T>) {
//        self.keyPath = keyPath
//    }
//    
//    public var wrappedValue: T {
//        // Resolvemos la dependencia a través del singleton
//        DependenciesInjection.shared[keyPath]
//    }
//}

@propertyWrapper
public struct Inject<T> {
    private let keyPath: KeyPath<DependenciesInjection, T>
    
    public init(_ keyPath: KeyPath<DependenciesInjection, T>) {
        self.keyPath = keyPath
    }
    
    public var wrappedValue: T {
        DependenciesInjection.shared[keyPath]
    }
}
