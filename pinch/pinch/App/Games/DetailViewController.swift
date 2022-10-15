//
//  DetailViewController.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    @IBOutlet weak var gameScreenshot: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    @IBOutlet weak var releaseYearLabel: UILabel!

    var viewModel: DetailViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let game = viewModel.game else {return}
        gameDescription.removeAllPadding()
        gameTitle.text = game.name?.capitalized
        gameDescription.text = game.summary?.capitalizingFirstLetter()
    }
}

extension DetailViewController: DetailViewDelegate {
    
}
