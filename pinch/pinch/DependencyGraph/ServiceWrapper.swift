//
//  ServiceWrapper.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

@propertyWrapper
struct Service<ServiceName> {
    private let service: ServiceName?

    init() {
        do {
            service = try DependencyResolver.shared.resolve(ServiceName.self)
        } catch {
            // LogError("init: Failed to fetch: \(ServiceName.self)",
            //          "Failed to resolve property for type \(ServiceName.self): \(error.localizedDescription)")
            service = nil
        }
    }

    public var wrappedValue: ServiceName? { service }
}

/**
 A lazy service gets retreived when the wrappedValue is read, and retreived every single time like this.
 This means there's no strong reference to a service, and the just-in-time setup will prevent dependency loops.
 The downside is, the lookup has to happen every time the value is fetched.
 */
@propertyWrapper
struct LazyService<ServiceName> {
    init() { }

    public var wrappedValue: ServiceName? {
        do {
            return try DependencyResolver.shared.resolve(ServiceName.self)
        } catch {
            // LogError("init: Failed to fetch: \(ServiceName.self)",
            //          "Failed to resolve property for type \(ServiceName.self): \(error.localizedDescription)")
            return nil
        }
    }
}
