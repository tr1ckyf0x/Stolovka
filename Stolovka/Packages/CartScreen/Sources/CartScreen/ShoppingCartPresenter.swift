//  Created by Nikita Shvad on 20.03.2022.
//

import Managers
import UseCase
import Models

final class ShoppingCartPresenter {

    weak var viewController: ShoppingCartControllerInput?

    var fetchCartItemsUseCase: AsyncUseCase<Void, [CountableContainer<FoodItem>]>?
    var shoppingCartTableViewManager: ShoppingCartTableManagerProtocol?
}

// MARK: - ShoppingCartControllerOutput
extension ShoppingCartPresenter: ShoppingCartControllerOutput {

    func view(_ view: ShoppingCartControllerInput, didTapAddButtonFor foodItem: FoodItem) {
        addToCartItemUseCase?.executeAsync(foodItem) {[weak self] (result: Result<Void, Error>) in
            switch result {
            case .success:
                print("Success")
                self?.fetchShoppingCartItems()

            case .failure:
                print("Failure")
            }
        }
    }

    func view(_ view: ShoppingCartControllerInput, didTapLikeButtonFor foodItem: FoodItem) {
        print("Did tap remove button")
    }

    func viewDidLoad(_ view: ShoppingCartControllerInput) {
        fetchShoppingCartItems()
    }
}

// MARK: - Private Methods
extension ShoppingCartPresenter {
    private func fetchShoppingCartItems() {
        fetchCartItemsUseCase?.executeAsync { [weak self] (result: Result<[CountableContainer<FoodItem>], Error>) in
            switch result {
            case let .success(shoppingCartFoodItems):
                self?.shoppingCartTableViewManager?.setShoppingCartFoodItems(shoppingCartFoodItems)
                self?.viewController?.reloadShoppingCartTableView()

            case let .failure(error):
                print(error)
            }
        }
    }
}
