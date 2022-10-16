//
//  DetailViewModel.swift
//  pinch
//
//  Created by Andrei on 15/10/2022.
//

import UIKit

class DetailViewModel: DetailViewModelType {
    
    weak var coordinatorDelegate: DetailViewModelCoordinatorDelegate?
    weak var viewDelegate: DetailViewDelegate?

    var endPointService: EndPointServiceType?

    required init() {
        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)

    }

    var game: Game?
    
    func getReleaseYear(_ unixTimeStamp: Double?) -> String {
        guard let unwrapped = unixTimeStamp else {return ""}
        let date = Date(timeIntervalSince1970: unwrapped)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
}

extension DetailViewModel: EasyRequestDelegate {
    func onNoConnection() {
        coordinatorDelegate?.showErrorPopup()
    }

    func onError() {
        coordinatorDelegate?.showErrorPopup()
    }
}
