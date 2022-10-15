//
//  GameCell.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class GameCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!

    static let identifier = CellType.GameCell

    func setup(viewModel: RowViewModel) {
        guard case .gameCell(let gameCellViewModel) = viewModel else { return }
        descriptionText.removeAllPadding()
        titleLabel.text = gameCellViewModel.title
        descriptionText.text = gameCellViewModel.description
        descriptionText.textContainer.maximumNumberOfLines = 2
        descriptionText.textContainer.lineBreakMode = .byTruncatingTail
    }
}

extension UITextView {
    func removeAllPadding() {
        UIUpdater.perform {
            let padding = self.textContainer.lineFragmentPadding
            self.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
        }
    }
}

struct UIUpdater {
    static func perform(using closure: @escaping () -> Void) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async(execute: closure)
        }
    }
}
