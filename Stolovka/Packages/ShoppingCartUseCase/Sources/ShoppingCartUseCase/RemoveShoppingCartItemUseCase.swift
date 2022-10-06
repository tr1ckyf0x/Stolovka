import Foundation
import Models
import Managers
import UseCase

public final class RemoveShoppingCartItemUseCase: AsyncUseCase<CountableContainer<FoodItem>, Void> {

    private let shoppingCart: ShoppingCartManagerProtocol
    private let itemRemovalAlert: ItemRemovalAlertProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol, itemRemovalAlert: ItemRemovalAlertProtocol) {
        self.shoppingCart = shoppingCart
        self.itemRemovalAlert = itemRemovalAlert
    }

    override public func executeAsync(_ foodItem: CountableContainer<FoodItem>, completion: @escaping (Result<Void, Error>) -> Void) {
        if foodItem.quantity == 1 {
            itemRemovalAlert.presentRemoveItemAlert(
                itemName: foodItem.item.name,
                success: { self.shoppingCart.removeFromCart(foodItem: foodItem.item, completion: completion) },
                cancel: { }
            )
        } else {
            self.shoppingCart.removeFromCart(foodItem: foodItem.item, completion: completion)
        }
    }
}
