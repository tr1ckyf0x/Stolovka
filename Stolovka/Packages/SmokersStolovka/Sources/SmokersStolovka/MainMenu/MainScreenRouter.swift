//
//  MainScreenRouter.swift
//  
//
//  Created by Vladislav Lisianskii on 24.03.2022.
//

import UIKit
import CartScreen

final class MainScreenRouter {
    weak var viewController: UIViewController?
}

extension MainScreenRouter: MainScreenRouterProtocol {
    func routeToShoppingCart() {
        let shoppingCartViewController = ShoppingCartAssembly.assembleShoppingCart()

        viewController?
            .navigationController?
            .pushViewController(
                shoppingCartViewController,
                animated: true
            )
    }
}
