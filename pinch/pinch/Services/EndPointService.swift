//
//  EndPointService.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

class EndPointService: EndPointServiceType, Resolvable {
    var apiBasePath: ApiBasePath

    struct ApiBasePath {
        var baseUrl = "https://api.igdb.com/v4/"
        var clientId = "ikefu3gjaojsnnt21ik7orxyofnztq"
        var token = "Bearer b9b8twp1it10ilyuf6r7n8ajw4tlzz"
    }

    required init(with resolver: Resolver) throws {
        apiBasePath = ApiBasePath()
    }

    fileprivate func getHttpFields(_ body: String) -> HttpFields {
        let header = (headerField: "Content-Type", value: "application/json")
        let headerToken = (headerField: "Authorization", value: apiBasePath.token)
        let receiverId = (headerField: "Client-ID", value: apiBasePath.clientId)
        let httpHeaders = [header, headerToken, receiverId]

        return HttpFields(httpMethod: .POST,
                          httpBody: body,
                          httpHeaders: httpHeaders)
    }

    func getGames(body: String,
                  errorDelegate: EasyRequestDelegate?,
                  onNoConnection: (() -> Data?)?,
                  response responseCallback: @escaping GetGamesCompletionHandler) {

        let httpFields = getHttpFields(body)
        let requestUrl = apiBasePath.baseUrl + "games"

        EasyRequest<[Game]?>.get(delegate: errorDelegate,
                                 url: requestUrl,
                                 httpFields: httpFields,
                                 onNoConnection: onNoConnection,
                                 success: { apiResonse in
            responseCallback(apiResonse)
        })
    }

    func getCovers(body: String,
                   errorDelegate: EasyRequestDelegate?,
                   response responseCallback: @escaping GetCoversCompletionHandler) {

        let httpFields = getHttpFields(body)
        let requestUrl = apiBasePath.baseUrl + "covers"

        EasyRequest<[Cover]?>.get(delegate: errorDelegate,
                                  url: requestUrl,
                                  httpFields: httpFields,
                                  onNoConnection: nil,
                                  success: { apiResonse in
            responseCallback(apiResonse)
        })
    }
}
