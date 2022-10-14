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

public struct EasyRequest<Model: Codable> {

    public typealias SuccessCompletionHandler = (_ response: Model) -> Void

    static func get(delegate: EasyRequestDelegate?,
                    path: String?,
                    url: String,
                    success successCallback: @escaping SuccessCompletionHandler) {

        guard let urlComponent = URLComponents(string: url), let usableUrl = urlComponent.url else {
            delegate?.onError()
            return
        }

        var request = URLRequest(url: usableUrl)
        request.httpMethod = "POST"

        var dataTask: URLSessionDataTask?
        let defaultSession = URLSession(configuration: .default)

        dataTask =
            defaultSession.dataTask(with: request) { data, response, error in
                defer {
                    dataTask = nil
                }
                if error != nil {
                    delegate?.onError()
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    guard let model = self.parsedModel(with: data, at: path) else {
                        delegate?.onError()
                        return
                    }
                    successCallback(model)
                }
        }
        dataTask?.resume()

    }

    static func parsedModel(with data: Data, at path: String?) -> Model? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            if let path = path, let dictAtPath = json?.value(forKeyPath: path) as? NSDictionary {
                return try parseModelFromJson(dictAtPath)
            } else if let json = json {
                return try parseModelFromJson(json)
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }

    fileprivate static func parseModelFromJson(_ json: NSDictionary) throws -> Model? {
        let jsonData = try JSONSerialization.data(withJSONObject: json,
                                                  options: .prettyPrinted)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let model =  try decoder.decode(Model.self, from: jsonData)
            return model
        } catch {
            print(error)
            print("failed to decode json: \(json) into \(Model.self)")
            return nil
        }
    }
}
