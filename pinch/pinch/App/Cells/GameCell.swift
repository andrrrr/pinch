//
//  GameCell.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class GameCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    static let identifier = CellType.GameCell

    func setup(viewModel: RowViewModel) {
        guard case .gameCell(let gameCellViewModel) = viewModel else { return }
        titleLabel.text = gameCellViewModel.title
    }
}
