//
//  GamesCoordinator.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation
import UIKit

class GamesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    let storyboard = StoryboardName.Games

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    lazy var gamesViewModel: GamesViewModel! = {
        let viewModel = GamesViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()

    lazy var errorViewModel: ErrorViewModel! = {
        let viewModel = ErrorViewModel()
        return viewModel
    }()

    func start() {
        let gamesViewController = GamesViewController.instantiate(storyboard)
        gamesViewController.viewModel = gamesViewModel
        navigationController.pushViewController(gamesViewController, animated: true)
    }
}

extension GamesCoordinator: GamesViewModelCoordinatorDelegate {
    func showErrorPopup() {
        let errorViewController = ErrorViewController.instantiate(storyboard)
        errorViewController.viewModel = errorViewModel
        navigationController.pushViewController(errorViewController, animated: true)
    }
}

extension GamesCoordinator: EasyRequestDelegate {
    func onError() {

    }
}

