//  Created by Nikita Shvad on 20.03.2022.
//
import UIKit
import Managers
import UseCase
import Models

final class ShoppingCartPresenter {

    weak var viewController: ShoppingCartControllerInput?

    var shoppingCartManager: ShoppingCartManagerProtocol?
    var fetchCartItemsUseCase: AsyncUseCase<Void, [FoodItem]>?
    var shoppingCartTableViewManager: ShoppingCartTableViewManager?
}

extension ShoppingCartPresenter: ShoppingCartControllerOutput {

    func viewDidLoad(_ view: ShoppingCartControllerInput) {
        fetchShoppingCartItems()
    }
}

// MARK: - Private Methods
extension ShoppingCartPresenter {
    private func fetchShoppingCartItems() {
        fetchCartItemsUseCase?.executeAsync { [weak self] (result: Result<[FoodItem], Error>) in
            switch result {
            case let .success(foodItems):
                self?.shoppingCartTableViewManager?.foodItems = foodItems
                self?.viewController?.reloadShoppingCartTableView()

            case let .failure(error):
                print(error)
            }
        }
    }
}
