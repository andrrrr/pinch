//
//  EndPointServiceType.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

protocol EndPointServiceType {
    typealias GetGamesCompletionHandler = (_ response: [Game]?) -> Void
    typealias GetCoversCompletionHandler = (_ response: [Cover]?) -> Void

    func getGames(body: String,
                  errorDelegate: EasyRequestDelegate?,
                  response responseCallback: @escaping GetGamesCompletionHandler)

    func getCovers(body: String,
                   errorDelegate: EasyRequestDelegate?,
                   response responseCallback: @escaping GetCoversCompletionHandler)
}
