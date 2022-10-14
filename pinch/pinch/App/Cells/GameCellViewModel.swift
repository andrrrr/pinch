//
//  GameCellViewModel.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

class GameCellViewModel: Equatable, ViewModelPressible {

    var title: String?
    var text: String?
    var imageUrl: String?
    var cellPressed: (() -> Void)?

    init(title: String?,
         text: String?,
         imageUrl: String?,
         cellPressed: (() -> Void)?) {
        self.title = title
        self.text = text
        self.imageUrl = imageUrl
        self.cellPressed = cellPressed
    }

    static func == (lhs: GameCellViewModel, rhs: GameCellViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.text == rhs.text
    }
}
