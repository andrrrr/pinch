//
//  GamesViewController.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import UIKit

class GamesViewController: UIViewController, Storyboarded {

    var viewModel: GamesViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getGames()
    }
}

extension GamesViewController: GamesViewDelegate {
    func refreshTable() {
        tableView.reloadData()
    }
}

