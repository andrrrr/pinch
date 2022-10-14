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

        setupTable()
        viewModel.getGames()
    }

    func setupTable() {
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    fileprivate func registerCells() {
        tableView.register(UINib(nibName: CellType.GameCell.rawValue, bundle: nil),
                           forCellReuseIdentifier: GameCell.identifier.rawValue)

    }
}

extension GamesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: rowViewModel), for: indexPath)
        cell.selectionStyle = .none
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.rows[indexPath.row]
        if let rowViewModel = cellViewModel.associatedValue() as? ViewModelPressible {
            rowViewModel.cellPressed?()
        }
    }

    private func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case .gameCell:
            return GameCell.identifier.rawValue
        }
    }
}

extension GamesViewController: GamesViewDelegate {
    func refreshTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

