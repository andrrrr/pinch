//
//  GamesViewModel.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation

class GamesViewModel: GamesViewModelType {

    weak var coordinatorDelegate: GamesViewModelCoordinatorDelegate?
    weak var viewDelegate: GamesViewDelegate?

    var endPointService: EndPointServiceType?
    var fileService: FileServiceType?

    var rows: [RowViewModel] = []
    var games: [Game]?
    var offset: Int
    let limit = 20

    required init() {
        offset = 0
        games = [Game]()

        resolveServices()
        getGames()

//        retrieveGamesFromMemory()
    }

    fileprivate func resolveServices() {
        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)
        fileService = try? resolver.resolve(FileServiceType.self)
    }

    func getGames() {
        fetchGames(addOffset: true)
    }

    func reloadGames() {
        fetchGames(addOffset: false)
    }

    func fetchGames(addOffset: Bool) {
        let offset = addOffset ? offset : 0
        let fields = "id,cover.url,name,summary,url,screenshots.*,first_release_date"
        let body = "fields: \(fields); limit \(limit); offset: \(offset);"
        endPointService?.getGames(body: body,
                                  errorDelegate: self,
                                  onNoConnection: retrieveGamesFromMemory,
                                  response: { games in

            guard let games = games else {
                self.onError()
                return
            }

            if addOffset {
                self.offset += self.limit
                self.games?.append(contentsOf: games)
            } else {
                self.games = games
            }
            self.rows = self.getCells()
            self.viewDelegate?.refreshTable()
            self.storeGames()
        })
    }

    fileprivate func storeGames() {
        DispatchQueue.global(qos: .background).async {
            guard let games = self.games else {return}
            guard let jsonData = try? JSONEncoder().encode(games) else {return}
            try? self.fileService?.save(data: jsonData)
        }
    }

    fileprivate func retrieveGamesFromMemory() -> Data? {
        let gamesData = try? fileService?.read()
        return gamesData ?? nil
    }

    func getCells() -> [RowViewModel] {
        var rows = [RowViewModel]()
        guard let games = games else {return []}

        for game in games {
            let cellModel = GameCellViewModel(game: game,
                                              cellPressed: { [weak self]  in
                self?.coordinatorDelegate?.showGameDetails(game: game)
            })

            rows.append(.gameCell(cellModel))
        }
        return rows
    }
}

extension GamesViewModel: EasyRequestDelegate {
    func onError() {
        coordinatorDelegate?.showErrorPopup()
    }
}
