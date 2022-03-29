//  Created by Nikita Shvad on 20.03.2022.
//
import UIKit
import Managers
import ShoppingCartUseCase

public enum ShoppingCartAssembly {
    public static func assembleShoppingCart() -> UIViewController {

        let viewController = ShoppingCartViewController()
        let presenter = ShoppingCartPresenter()

        let shoppingCartTableViewManager = ShoppingCartTableViewManager()
        let shoppingCartManager = ManagerFactory.shared.shoppingCartManager
        let fetchShoppingCartUseCase = FetchShoppingCartUseCase(shoppingCart: shoppingCartManager)

        viewController.setShoppingCartDataSource(dataSource: shoppingCartTableViewManager)
        presenter.shoppingCartManager = shoppingCartManager
        presenter.shoppingCartTableViewManager = shoppingCartTableViewManager
        presenter.fetchCartItemsUseCase = fetchShoppingCartUseCase

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
