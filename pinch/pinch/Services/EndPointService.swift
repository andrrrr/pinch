//
//  EndPointService.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

struct ApiBasePath {
    var baseUrl = "https://api.igdb.com/v4/"
    var clientId = "ikefu3gjaojsnnt21ik7orxyofnztq"
    var token = "Bearer b9b8twp1it10ilyuf6r7n8ajw4tlzz"
}

class EndPointService: EndPointServiceType, Resolvable {
    var apiBasePath: ApiBasePath

    required init(with resolver: Resolver) throws {
        apiBasePath = ApiBasePath()
    }

    func getGames(body: String,
                  errorDelegate: EasyRequestDelegate?,
                  response responseCallback: @escaping GetGamesCompletionHandler) {

        let header = (headerField: "Content-Type", value: "application/json")
        let headerToken = (headerField: "Authorization", value: apiBasePath.token)
        let receiverId = (headerField: "Client-ID", value: apiBasePath.clientId)
        let httpHeaders = [header, headerToken, receiverId]

        let httpFields = HttpFields(httpMethod: .POST,
                                    httpBody: body,
                                    httpHeaders: httpHeaders)

        let requestUrl = apiBasePath.baseUrl + "games"

        EasyRequest<[Game]?>.get(delegate: errorDelegate,
                                 url: requestUrl,
                                 httpFields: httpFields,
                                 success: { apiResonse in
            responseCallback(apiResonse)
        })
    }
}
