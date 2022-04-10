//
//  ShoppingCartViewController.swift
//
//
//  Created by Nikita Shvad on 20.03.2022.
//
import UIKit
import SharedResources

// TODO: Fix navigation. func didtapShoppingCart

final class ShoppingCartViewController: UIViewController {

    private let shoppingCartView = ShoppingCartView()

    var presenter: ShoppingCartControllerOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        self.title = L10n.shoppingCart
    }

    override func loadView() {
        view = shoppingCartView
    }

    func setShoppingCartDataSource(dataSource: UITableViewDataSource) {
        shoppingCartView.shoppingCartTableView.dataSource = dataSource
    }
}

// MARK: - ShoppingCartControllerInput
extension ShoppingCartViewController: ShoppingCartControllerInput {
    func reloadShoppingCartTableView() {
        shoppingCartView.shoppingCartTableView.reloadTableView()
    }
}
