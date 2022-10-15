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

    var imageService: ImageServiceType?

    var viewModel: DetailViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let resolver = DependencyResolver.shared
        imageService = try? resolver.resolve(ImageServiceType.self)

        setupUI()
    }

    private func setupUI() {
        guard let game = viewModel.game else {return}
        gameDescription.removeAllPadding()
        gameTitle.text = game.name?.capitalized
        gameDescription.text = game.summary?.capitalizingFirstLetter()
        releaseYearLabel.text = viewModel.getReleaseYear(game.first_release_date)
        setImage(game)
    }

    func setImage(_ game: Game) {
        
        if let url = game.screenshots?[0].url?.replacingOccurrences(of: "//", with: "https://") {
            if let imageData = self.imageService?.getImageData(url: url) {
                self.gameScreenshot.image = UIImage(data: imageData)
                return
            }

            self.imageService?.downloadImage(imageUrl: url, successClosure: { [weak self] imageData in
                if let imageData = imageData {
                    DispatchQueue.main.async {
                        self?.gameScreenshot.image = UIImage(data: imageData)
                    }
                }
            })
        }
    }
}

extension DetailViewController: DetailViewDelegate {
}
