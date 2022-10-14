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

    func getGames() {
        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)
        endPointService?.getGames(body: "fields: *;",
                                  errorDelegate: self,
                                  response: { games in
            print(games ?? "nope")
            self.games = games
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
