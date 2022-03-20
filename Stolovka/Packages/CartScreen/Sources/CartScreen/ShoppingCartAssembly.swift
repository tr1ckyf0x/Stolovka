//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit

public enum ShoppingCartAssembly {
    public static func assembleShoppingCart() -> UIViewController {
        let viewController = ShoppingCartViewController()
        let presenter = ShoppingCartPresenter()

        let shoppingCartManager = ShoppingCartTableViewManager()

        viewController.setShoppingCartDataSource(dataSource: shoppingCartManager)

        presenter.tableViewManager = shoppingCartManager
        viewController.presenter = presenter

        return viewController
    }
}
