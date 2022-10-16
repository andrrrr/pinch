//
//  EasyRequest.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

protocol EasyRequestDelegate: AnyObject {
    func onError()
}

enum HttpMethod: String {
    case GET, POST
}

public typealias HttpHeader = (headerField: String, value: String)

struct HttpFields {
    var httpMethod: HttpMethod? = .GET
    var httpBody: String?
    var httpHeaders: [HttpHeader]? = []
}

public struct EasyRequest<Model: Codable> {

    public typealias SuccessCompletionHandler = (_ response: Model) -> Void

    static func get(delegate: EasyRequestDelegate?,
                    url: String,
                    httpFields: HttpFields? = nil,
                    onNoConnection: (() -> Data?)?,
                    success successCallback: @escaping SuccessCompletionHandler) {

        guard let urlComponent = URLComponents(string: url),
              let usableUrl = urlComponent.url else {
            delegate?.onError()
            return
        }

        var request = URLRequest(url: usableUrl)
        request.httpMethod = httpFields?.httpMethod?.rawValue ?? "GET"
        if let httpBody = httpFields?.httpBody?.data(using: .utf8) {
            request.httpBody = httpBody
        }

        if let headers = httpFields?.httpHeaders {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.headerField)
            }
        }

        var dataTask: URLSessionDataTask?
        let defaultSession = URLSession(configuration: .ephemeral)

        dataTask =
            defaultSession.dataTask(with: request) { data, response, error in
                defer {
                    dataTask = nil
                }
                if error != nil {
                    if let error = error as? URLError,
                       error.code.rawValue == -1020,
                       let gamesData = onNoConnection?() {

                        guard let model = self.parsedModel(with: gamesData) else {
                            delegate?.onError()
                            return
                        }
                        successCallback(model)
                    } else {
                        delegate?.onError()
                    }
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    guard let model = self.parsedModel(with: data) else {
                        delegate?.onError()
                        return
                    }
                    successCallback(model)
                }
        }
        dataTask?.resume()

    }

    static func parsedModel(with data: Data) -> Model? {
        let decoder = JSONDecoder()
        do {
            let model =  try decoder.decode(Model.self, from: data)
            return model
        } catch {
            print(error)
            return nil
        }
    }
}
