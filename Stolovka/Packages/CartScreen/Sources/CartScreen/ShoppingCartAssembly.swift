//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import Managers

public enum ShoppingCartAssembly {
    public static func assembleShoppingCart() -> UIViewController {

        let viewController = ShoppingCartViewController()
        let presenter = ShoppingCartPresenter()

        let shoppingCartTableViewManager = ShoppingCartTableViewManager()
        let shoppingCartManager = ShoppingCartManager()
        let fetchShoppingCartUseCase = 
        viewController.setShoppingCartDataSource(dataSource: shoppingCartTableViewManager)
        presenter.shoppingCartManager = shoppingCartManager
        
        viewController.presenter = presenter

        return viewController
    }
}
