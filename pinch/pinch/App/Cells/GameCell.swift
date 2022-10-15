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
    @IBOutlet weak var iconImageView: UIImageView!

    static let identifier = CellType.GameCell

    func setup(viewModel: RowViewModel) {
        guard case .gameCell(let gameCellViewModel) = viewModel else { return }
        descriptionText.removeAllPadding()
        titleLabel.text = gameCellViewModel.title?.capitalized
        descriptionText.text = gameCellViewModel.description?.capitalizingFirstLetter()
        descriptionText.textContainer.maximumNumberOfLines = 2
        descriptionText.textContainer.lineBreakMode = .byTruncatingTail
        getImage(gameCellViewModel.imageUrl)
    }

    func getImage(_ url: String?) {
        guard let url = url?.replacingOccurrences(of: "//", with: "https://") else {return}
        let resolver = DependencyResolver.shared
        if let imageService = try? resolver.resolve(ImageServiceType.self) {
            if let imageData = imageService.getImageData(url: url) {
                self.iconImageView.image = UIImage(data: imageData)
                return
            }

            imageService.downloadImage(imageUrl: url, successClosure: { [weak self] imageData in
                if let imageData = imageData {
                    DispatchQueue.main.async {
                        self?.iconImageView.image = UIImage(data: imageData)
                    }
                }
            })
        }
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

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
