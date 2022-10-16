//
//  GamesViewModelType.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

protocol GamesViewModelType {
    var coordinatorDelegate: GamesViewModelCoordinatorDelegate? { get set }
    var viewDelegate: GamesViewDelegate? { get set }
    var rows: [RowViewModel] { get set }
    var games: [Game]? { get set }

    func getGames()
    func getGamesLocked()
    func reloadGames()
}

protocol GamesViewModelCoordinatorDelegate: AnyObject {
    func showErrorPopup()
    func showGameDetails(game: Game)
}

protocol GamesViewDelegate: AnyObject {
    func refreshTable()
}

