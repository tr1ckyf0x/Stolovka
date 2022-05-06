//  Created by Nikita Shvad on 20.03.2022.
//
import UIKit
import Managers
import ShoppingCartUseCase
import UIComponents

public enum ShoppingCartAssembly {
    public static func assembleShoppingCart() -> UIViewController {

        let viewController = ShoppingCartViewController()
        let presenter = ShoppingCartPresenter()

        let shoppingCartTableViewManager = ShoppingCartTableViewManager()
        let shoppingCartManager = ManagerFactory.shared.shoppingCartManager
        let fetchShoppingCartUseCase = FetchShoppingCartUseCase(shoppingCart: shoppingCartManager)
        let addToCartItemUseCase = AddToCartUseCase(shoppingCart: shoppingCartManager)
        let removeFromCartUseCase = RemoveShoppingCartItemUseCase(shoppingCart: shoppingCartManager)

        shoppingCartTableViewManager.delegate = viewController
    
        viewController.setShoppingCartDataSource(dataSource: shoppingCartTableViewManager)
        presenter.shoppingCartTableViewManager = shoppingCartTableViewManager
        presenter.fetchCartItemsUseCase = fetchShoppingCartUseCase
        presenter.addToCartUseCase = addToCartItemUseCase
        presenter.removeFromCartUseCase = removeFromCartUseCase

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
