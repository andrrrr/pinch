//
//  EndPointService.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

class EndPointService: EndPointServiceType, Resolvable {
    var apiBasePath: ApiBasePath?

    required init(with resolver: Resolver) throws {
        apiBasePath = ApiBasePath()
    }
}
