//
//  FileServiceType.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import Foundation

protocol FileServiceType {
    func save(data: Data) throws
    func read() throws -> Data
}
