//
//  ImageService.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import Foundation
import UIKit

class ImageService: ImageServiceType, Resolvable {
    required init(with resolver: Resolver) throws {}

    func getImageData(url: String) -> Data? {
        if let imageData = UserDefaults.standard.object(forKey: url) as? Data {
            return imageData
        }
        return nil
    }

    func downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: imageUrl),
               let imageData = try? Data(contentsOf: url) {
                successClosure(imageData)
                DispatchQueue.main.async {
                    self.storeImageData(imageData: imageData, forKey: imageUrl)
                }
            }
        }
    }

    private func storeImageData(imageData: Data?, forKey key: String) {
        if let imageData = imageData {
            UserDefaults.standard.set(imageData, forKey: key)
        }
    }


}
