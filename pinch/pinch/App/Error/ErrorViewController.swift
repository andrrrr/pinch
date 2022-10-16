//
//  ErrorViewController.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class ErrorViewController: UIViewController, Storyboarded {

    @IBAction func okTapped(_ sender: Any) {
        viewModel.coordinatorDelegate?.goBackToList()
    }
    
    var viewModel: ErrorViewModelType!
}
