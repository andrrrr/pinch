//
//  EndPointServiceType.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

protocol EndPointServiceType {
    var apiBasePath: ApiBasePath { get set }

    typealias GetGamesCompletionHandler = (_ response: [Game]?) -> Void

    func getGames(body: String,
                  errorDelegate: EasyRequestDelegate?,
                  response responseCallback: @escaping GetGamesCompletionHandler)
}
