//
//  FileService.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import Foundation

class FileService: FileServiceType, Resolvable {

    let fileName = "23o1ejfiniouenr984e"

    required init(with resolver: Resolver) throws {
        self.fileManager = .default
    }

    enum Error: Swift.Error {
        case fileAlreadyExists
        case invalidDirectory
        case writingFailed
        case fileDoesNotExist
        case readingFailed
    }

    let fileManager: FileManager

    func save(data: Data) throws {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        print(url.path)

        try? fileManager.removeItem(at: url)
        if fileManager.fileExists(atPath: url.path) {
            throw Error.fileAlreadyExists
        }
        do {
            try data.write(to: url)
        } catch {
            print(error)
            throw Error.writingFailed
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    private func makeURL(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }

    func read() throws -> Data {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        print(url.path)
        guard fileManager.fileExists(atPath: url.path) else {
            throw Error.fileDoesNotExist
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            debugPrint(error)
            throw Error.readingFailed
        }
    }
}



