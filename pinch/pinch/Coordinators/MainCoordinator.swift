//
//  MainCoordinator.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        startGamesCoordinator()
    }

    func startGamesCoordinator() {
        let gamesCoordinator = GamesCoordinator(navigationController: navigationController)
        childCoordinators.append(gamesCoordinator)
        gamesCoordinator.start()
    }
}
