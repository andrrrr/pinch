//
//  GameCellViewModel.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

class GameCellViewModel: Equatable, ViewModelPressible {

    var title: String?
    var description: String?
    var imageUrl: String?

    var game: Game
    var cellPressed: (() -> Void)?

    init(game: Game,
         cellPressed: (() -> Void)?) {
        self.game = game
        self.title = game.name
        self.description = game.summary
        self.imageUrl = game.cover?.url
        self.cellPressed = cellPressed
    }

    static func == (lhs: GameCellViewModel, rhs: GameCellViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description
    }
}
