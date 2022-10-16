import Foundation

@testable import pinchApp

/**
 Helper class to build dependencies for a test
 */
// swiftlint:disable force_cast

class DependencyHelper {
    private let resolver = DependencyResolver()

    func register<T: Any>(type: T.Type, item: T) -> Self {
        resolver.register(type, { _ in item })
        return self
    }

    func register<T: Any>(_ type: T.Type, _ initiator: @escaping DependencyResolver.Generator<T>) -> Self {
        resolver.register(type, initiator)
        return self
    }

    /// Register contents in the default (shared) resolver.
    /// This can be useful to make sure
    /// Also: be sure to reset the shared instance at the end of tests
    func registerAsDefaultResolver() {
        (DependencyResolver.shared as! DependencyResolver).reset(to: resolver)
    }

    /// Reset shared resolver to be empty
    static func resetDefaultResolver() {
        (DependencyResolver.shared as! DependencyResolver).reset(to: DependencyResolver())
    }

    func build() -> Resolver {
        return resolver
    }
}
