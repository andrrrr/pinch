//
//  Coordinator.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
