//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

final class ShoppingCartTableView: UIView {

    private lazy var tableView: UITableView = {

        let tableView = UITableView()
        tableView.backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        tableView.register(ShoppingCartTableViewCell.self, forCellReuseIdentifier: "\(ShoppingCartTableViewCell.self)")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.allowsSelection = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
// MARK: - Public Methods
extension ShoppingCartTableView {

    public func reloadTableView() {
        tableView.reloadData()
    }

    var dataSource: UITableViewDataSource? {
        get {
            tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }

    var delegate: UITableViewDelegate? {
        get {
            tableView.delegate
        }
        set {
            tableView.delegate = newValue
        }
    }

}

// MARK: - Private Methods
extension ShoppingCartTableView {
    private func setupView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
