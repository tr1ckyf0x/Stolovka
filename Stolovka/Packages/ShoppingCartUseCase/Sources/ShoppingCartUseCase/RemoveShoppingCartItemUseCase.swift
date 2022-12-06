import Foundation
import Models
import Managers
import UseCase

public final class RemoveShoppingCartItemUseCase: AsyncUseCase<CountableContainer<FoodItem>, Void> {

    private var shoppingCart: ShoppingCartManagerProtocol
    private let itemRemovalAlert: ItemRemovalAlertProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol, itemRemovalAlert: ItemRemovalAlertProtocol) {
        self.shoppingCart = shoppingCart
        self.itemRemovalAlert = itemRemovalAlert
    }

    override public func executeAsync(_ foodItem: CountableContainer<FoodItem>, completion: @escaping (Result<Void, Error>) -> Void) {
        if foodItem.quantity == 1 {
            itemRemovalAlert.onSuccess(
                itemName: foodItem.item.name,
                success: { [weak self] in
                    self?.shoppingCart.removeFromCart(foodItem: foodItem.item, completion: completion)
                },
                cancel: { }
            )
        } else {
            self.shoppingCart.removeFromCart(foodItem: foodItem.item, completion: completion)
        }
    }
}
