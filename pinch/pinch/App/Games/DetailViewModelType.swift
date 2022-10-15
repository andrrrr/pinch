//
//  DetailViewModelType.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

protocol DetailViewModelType {
    var coordinatorDelegate: DetailViewModelCoordinatorDelegate? { get set }
    var viewDelegate: DetailViewDelegate? { get set }

    var game: Game? { get set }
}

protocol DetailViewModelCoordinatorDelegate: AnyObject {
}

protocol DetailViewDelegate: AnyObject {
}
