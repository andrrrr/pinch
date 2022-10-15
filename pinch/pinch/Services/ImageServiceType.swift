//
//  ImageServiceType.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import UIKit

protocol ImageServiceType {
    func getImageData(url: String) -> Data?
    func downloadImage(imageUrl: String, successClosure: (Data?) -> Void)
}
