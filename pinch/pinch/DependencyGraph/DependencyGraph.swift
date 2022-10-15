//
//  DependencyGraph.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

class DependencyGraph {
    static func setup(for registry: DependencyRegistry) {
        registry.register(EndPointServiceType.self, { try EndPointService(with: $0)})
        registry.register(ImageServiceType.self, { try ImageService(with: $0)})
    }
}
