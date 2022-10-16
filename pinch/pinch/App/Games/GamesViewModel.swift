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
    var lock = false

    required init() {
        offset = 0
        games = [Game]()

        resolveServices()
        getGames()
    }

    fileprivate func resolveServices() {
        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)
        fileService = try? resolver.resolve(FileServiceType.self)
    }

    func getGamesLocked() {
        if !lock {
            lock = true
            fetchGames(addOffset: true)
        }
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
            self.lock = false
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

    func delayedClosure(_ closureDelayed: (() -> Void)? ) {
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            closureDelayed?()
        }
    }
}

extension GamesViewModel: EasyRequestDelegate {
    func onError() {
        coordinatorDelegate?.showErrorPopup()
    }

    func onNoConnection() {
        guard let gamesData = retrieveGamesFromMemory() else {return}
        let decoder = JSONDecoder()
        do {
            let games =  try decoder.decode([Game].self, from: gamesData)
            DispatchQueue.main.async {
                self.games = games
                self.rows = self.getCells()
                self.viewDelegate?.refreshTable()
                self.delayedClosure({
                    self.lock = false
                })
            }
        } catch {
            print(error)
            coordinatorDelegate?.showErrorPopup()
        }
    }
}
