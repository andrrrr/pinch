//
//  EndPointService.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

struct ApiBasePath {
    var baseUrl = "https://api.igdb.com/v4/"
    var clientId = "ikefu3gjaojsnnt21ik7orxyofnztq"
    var token = "b9b8twp1it10ilyuf6r7n8ajw4tlzz"
}

class EndPointService: EndPointServiceType, Resolvable {
    var apiBasePath: ApiBasePath

    required init(with resolver: Resolver) throws {
        apiBasePath = ApiBasePath()
    }

    func getGames(errorDelegate: EasyRequestDelegate?,
                  response responseCallback: @escaping GetGamesCompletionHandler) {

        let header = (headerField: "Content-Type", value: "application/json")
        let headerToken = (headerField: "Authorization", value: apiBasePath.token)
        let receiverId = (headerField: "Client-ID", value: apiBasePath.clientId)
        let httpHeaders = [header, headerToken, receiverId]
        let requestUrl = apiBasePath.baseUrl + "games"

        EasyRequest<[Game]?>
            .get(delegate: errorDelegate,
                 path: nil,
                 url: requestUrl,
                         success: { apiResonse in
                            responseCallback(apiResonse)
                         })

    }
}
