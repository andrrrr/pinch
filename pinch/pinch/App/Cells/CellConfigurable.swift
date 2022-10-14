//
//  CellConfigurable.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

protocol CellConfigurable {
    func setup(viewModel: RowViewModel)
}

protocol ViewModelPressible {
    var cellPressed: (() -> Void)? { get set }
}

enum CellType: String {
    case GameCell
}

enum RowViewModel {
    case gameCell(GameCellViewModel)

    func associatedValue() -> Any {
        switch self {
        case .gameCell(let value): return value
        }
    }
}
