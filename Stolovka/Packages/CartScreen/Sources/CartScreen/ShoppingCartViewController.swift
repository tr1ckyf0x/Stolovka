//
//  ShoppingCartViewController.swift
//
//
//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import SharedResources

// TODO: Fix navigation. func didtapShoppingCart

final class ShoppingCartViewController: UIViewController {

    private let shoppingCartView = ShoppingCartView()
    var presenter: ShoppingCartControllerOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad(self)
        self.title = L10n.shoppingCart
    }

    override func loadView() {
        view = shoppingCartView
    }

    private func setupView() {
        setupNavigationBar()
    }

    private func setupNavigationBar() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(sfSymbol: SFSymbol.takeoutbagAndCupAndStraw),
            style: .plain,
            target: self,
            action: #selector(didTapShoppingCart)
        )

        navigationItem.rightBarButtonItem?.tintColor = SharedResources
            .Asset
            .Colors
            .shoppingCart
            .color
    }

    func setShoppingCartDataSource(dataSource: UITableViewDataSource) {
        shoppingCartView.shoppingCartTableView.dataSource = dataSource
    }

    @objc
    private func didTapShoppingCart() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ShoppingCartViewController: ShoppingCartControllerInput {

    func reloadShoppingCartTableView() {
        shoppingCartView.shoppingCartTableView.reloadTableView()
    }
}
