//
//  DependencyGraph.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

class DependencyGraph {
    static func setup(for registry: DependencyRegistry) {
        registry.register(EndPointServiceType.self, { try EndPointServiceService(with: $0)})
    }
}
