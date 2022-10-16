//
//  ErrorViewModelType.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

protocol ErrorViewModelType {
    var coordinatorDelegate: ErrorViewModelCoordinatorDelegate? { get set }
}

protocol ErrorViewModelCoordinatorDelegate: AnyObject {
    func goBackToList()
}
