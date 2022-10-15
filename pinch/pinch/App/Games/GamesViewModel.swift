//
//  GamesViewModel.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

class GamesViewModel: GamesViewModelType {

    weak var coordinatorDelegate: GamesViewModelCoordinatorDelegate?
    weak var viewDelegate: GamesViewDelegate?

    var endPointService: EndPointServiceType?
    var rows: [RowViewModel] = []
    var games: [Game]?
    var offset: Int
    let limit = 20

    required init() {
        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)
        offset = 0
        games = [Game]()
        getGames()
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
        })
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
