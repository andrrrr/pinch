//
//  DependencyResolver.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

public protocol Dependency {
    /// livecycle of the dependency
    /// Default: `.service`
    var lifeCycle: DependencyLifecycle { get }
}

/// Resolvable dependencies can be initialized when needed (lazily)
public protocol Resolvable: Dependency {
    init(with resolver: Resolver) throws
}

public extension Dependency {
    var lifeCycle: DependencyLifecycle { return .service }
}

/**
 Lifecycle of a depedency
 Services are meant to only be created once and cached.
 A disposableComponent will not be cached. Resolving it again will result in a new instance
*/
public enum DependencyLifecycle {
    case service, disposableComponent
}

public protocol Resolver {
    func resolve<T: Any>(_ type: T.Type) throws -> T
}

public protocol DependencyRegistry {
    /// Register using specified type, can be used to register an instance as a more generic type or protocol
    /// When a generator is called, the result is cached if the resulting object is specified having a service lifecycle
    func register<T: Any>(_ type: T.Type, _ initiator: @escaping DependencyResolver.Generator<T>)
}

enum ResolveError: Error {
    case noMatchFound, multipleMatchesFound, dependencyLoopDetected, initializationFailed
}

public final class DependencyResolver: Resolver, DependencyRegistry {

    private let nameQueue = DispatchQueue(label: "name.accessor", qos: .default, attributes: .concurrent)
    private static let instance = DependencyResolver()
    private var initiators: [String: Generator<Any>] = [:]
    private var cachedObjects: [String: Any] = [:]
    private var queuedForInitiating: [String] = []

    public init() {}

    public static var shared: Resolver { return instance }
    public typealias Generator<T: Any> = (_ resolver: Resolver) throws -> T

    public func register<T: Any>(_ type: T.Type, _ initiator: @escaping Generator<T>) {
        let name = String(describing: type)
        initiators[name] = initiator
    }

    public func resolve<T>(_ type: T.Type) throws -> T {
        let name = String(describing: type)

        if let item = cachedObjects[name] as? T {
            return item
        }

        try push(type)

        if let item = try checkInitiators(type) ?? tryAutoResolve(type) {
            tryCache(type, item)
            pop(type)
            return item
        }
        pop(type)
        throw ResolveError.noMatchFound
    }

    // swiftlint:disable identifier_name
    func reset(to: DependencyResolver? = nil) {
        initiators = to?.initiators ?? [:]
        cachedObjects = to?.cachedObjects ?? [:]
    }
    // swiftlint:enable identifier_name

    private func checkInitiators<T>(_ type: T.Type) throws -> T? {
        let name = String(describing: type)

        if let result = initiators[name],
            let item = try result(self) as? T {
            return item
        }
        return nil
    }

    private func tryAutoResolve<T>(_ type: T.Type) throws -> T? {
        guard let resolvable = type as? Resolvable.Type,
            let item = try resolvable.init(with: self) as? T else {
                return nil
        }

        return item
    }

    private func tryCache<T>(_ type: T.Type, _ object: T) {
        guard let object = object as? Resolvable,
            object.lifeCycle == .service else {
                return
        }

        let name = String(describing: type)
        cachedObjects[name] = object
    }

    private func push<T>(_ type: T.Type) throws {
        let name = String(describing: type)
        if queuedForInitiating.contains(name) {
            throw ResolveError.dependencyLoopDetected
        }
        queuedForInitiating.append(name)
    }

    private func pop<T>(_ type: T.Type) {
        let name = String(describing: type)
        queuedForInitiating.removeAll { $0 == name }
    }
}

