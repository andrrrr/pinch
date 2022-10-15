//
//  DetailViewModel.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

class DetailViewModel: DetailViewModelType {
    
    weak var coordinatorDelegate: DetailViewModelCoordinatorDelegate?
    weak var viewDelegate: DetailViewDelegate?

    var game: Game?
}
