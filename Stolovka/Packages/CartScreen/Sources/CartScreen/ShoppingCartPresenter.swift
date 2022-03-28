//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import Managers
import UseCase
import Models

final class ShoppingCartPresenter {
    var shoppingCartManager: ShoppingCartManager?
    var fetchCartItemsUseCase: AsyncUseCase<[FoodItem], Void>?
}

extension ShoppingCartPresenter: ShoppingCartControllerOutput {

    func viewDidLoad(_ view: ShoppingCartControllerInput) {
        view.reloadShoppingCartTableView()
    }
}

// MARK: - Private Methods
extension ShoppingCartPresenter {
    private func fetchShoppingCartItems() {
        print("fetching")
    }
}
