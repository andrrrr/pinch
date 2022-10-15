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
        let body = "fields: *; limit \(limit); offset: \(offset);"
        endPointService?.getGames(body: body,
                                  errorDelegate: self,
                                  response: { games in
            guard let games = games else {
                self.onError()
                return
            }
            self.offset += self.limit
            self.games?.append(contentsOf: games)
            self.rows = self.getCells()
            self.viewDelegate?.refreshTable()
        })
    }

    func getCells() -> [RowViewModel] {
        var rows = [RowViewModel]()
        guard let games = games else {return []}

        for (idx, game) in games.enumerated() {
            let cellModel = GameCellViewModel(title: game.name,
                                              text: game.summary,
                                              description: game.summary,
                                              imageUrl: game.url,
                                              cellPressed: {})

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
