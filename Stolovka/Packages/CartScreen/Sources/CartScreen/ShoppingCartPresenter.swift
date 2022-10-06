//  Created by Nikita Shvad on 20.03.2022.
//

import Managers
import UseCase
import Models

final class ShoppingCartPresenter {

    weak var viewController: ShoppingCartControllerInput?

    var fetchCartItemsUseCase: AsyncUseCase<Void, [CountableContainer<FoodItem>]>?
    var shoppingCartTableViewManager: ShoppingCartTableManagerProtocol?
    var addToCartUseCase: AsyncUseCase<FoodItem, Void>?
    var removeFromCartUseCase: AsyncUseCase<CountableContainer<FoodItem>, Void>?
    var purchaseShoppingCartItemsUseCase: AsyncUseCase<[CountableContainer<FoodItem>], Void>?
    var preparePurchaseBlockViewModelUseCase: UseCase<[CountableContainer<FoodItem>], PurchaseBlockViewModel>?
}

// MARK: - ShoppingCartControllerOutput
extension ShoppingCartPresenter: ShoppingCartControllerOutput {

    func viewDidLoad(_ view: ShoppingCartControllerInput) {
        fetchShoppingCartItems()
    }

    func view(
        _ view: ShoppingCartControllerInput,
        didTapAddButtonFor foodItem: CountableContainer<FoodItem>
    ) {
        addToCartUseCase?.executeAsync(foodItem.item) { [weak self] (result: Result<Void, Error>) in
            switch result {
            case .success:
                self?.fetchShoppingCartItems()

            case .failure:
                print("Failed to add an item")
            }
        }
    }

    func view(
        _ view: ShoppingCartControllerInput,
        didTapRemoveButtonFor foodItem: CountableContainer<FoodItem>
    ) {
        removeFromCartUseCase?.executeAsync(foodItem) { [weak self] (result: Result<Void, Error>) in
            switch result {
            case .success:
                self?.fetchShoppingCartItems()

            case .failure:
                print("failed to remove an item")
            }
        }
    }

    func viewDidTapPurchaseButton(_ view: ShoppingCartControllerInput) {
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
                self?.updatePurchaseBlock(from: shoppingCartFoodItems)

            case let .failure(error):
                print(error)
            }
        }
    }

    private func updatePurchaseBlock(from containers: [CountableContainer<FoodItem>]) {
        guard let shoppingCartViewModel = preparePurchaseBlockViewModelUseCase?.execute(containers) else { return }
        viewController?.configurePurchaseBlock(with: shoppingCartViewModel)
    }
}
