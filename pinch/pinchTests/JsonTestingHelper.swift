import Foundation

@testable import pinchApp

class JsonTestingHelper {

    static func getDataFromLocalResource(resource: String) -> Data? {
        let bundle = Bundle(for: self)
        if let path = bundle.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("Error while e  data: \(error)")
                return nil
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }

    static func decodeJSON<T: Decodable>(resourceName: String, model: T.Type) -> T? {
        let decoder = JSONDecoder()

        if let data = JsonTestingHelper.getDataFromLocalResource(resource: resourceName) {
            do {
                let decodedModel = try decoder.decode(model.self, from: data)
                return decodedModel
            } catch {
                print("Error while decodning JSON: \(error)")
                return nil
            }
        } else {
            return nil
        }
    }
}
