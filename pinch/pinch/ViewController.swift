//
//  ViewController.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class ViewController: UIViewController {

    var endPointService: EndPointServiceType?

    override func viewDidLoad() {
        super.viewDidLoad()

        let resolver = DependencyResolver.shared
        endPointService = try? resolver.resolve(EndPointServiceType.self)
        endPointService?.getGames(body: "fields: *;",
                                  errorDelegate: self,
                                  response: { games in
            print(games ?? "nope")
        })
    }
}


extension ViewController: EasyRequestDelegate {
    func onError() {
        print("oops")
    }
}
