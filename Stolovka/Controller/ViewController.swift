//
//  ViewController.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = StolovkaViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = viewModel
        tableView.register(GreetingCell.self, forCellReuseIdentifier: "\(GreetingCell.self)")
        tableView.register(SearchBarCell.self, forCellReuseIdentifier: "\(SearchBarCell.self)")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = constants.viewControllerTableViewBackgroundColor
        tableView.allowsSelection = false
        tableView.separatorStyle = .none

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        
    }
    
    func setupview() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), style: .plain, target: self, action: #selector (didTapShoppingCart ))
        navigationItem.rightBarButtonItem?.tintColor = constants.navigationItemShoppingCartColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: . plain, target: self, action: #selector (didTapMenuButton ))
        navigationItem.leftBarButtonItem?.tintColor = constants.navigationItemMenuColor
        
        view.backgroundColor = constants.viewControllerBackgroundColor
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    @objc func didTapShoppingCart() {
        print("Tapped Shopping Cart")
    }
    
    @objc func didTapMenuButton() {
        print("Tapped Menu Button")
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = tableView.backgroundColor
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
