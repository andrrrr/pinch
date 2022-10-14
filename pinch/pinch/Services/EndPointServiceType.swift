//
//  EndPointServiceType.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

protocol EndPointServiceType {
    var apiBasePath: ApiBasePath? { get set }
}

struct ApiBasePath {
    var baseUrl = "https://api-docs.igdb.com/#game"
    var clientId = "ikefu3gjaojsnnt21ik7orxyofnztq"
    var token = "b9b8twp1it10ilyuf6r7n8ajw4tlzz"
}
