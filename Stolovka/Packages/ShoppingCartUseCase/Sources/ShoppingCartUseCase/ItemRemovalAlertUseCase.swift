import Foundation
import Models
import Managers
import UseCase

public final class ItemRemovalAlertUseCase: AsyncUseCase<FoodItem, Void> {

    private let itemRemovalAlert: ItemRemovalAlertProtocol
    private let shoppingCart: ShoppingCartManagerProtocol

    public init(
        shoppingCart: ShoppingCartManagerProtocol,
        itemRemovalAlert: ItemRemovalAlertProtocol
    ) {
        self.shoppingCart = shoppingCart
        self.itemRemovalAlert = itemRemovalAlert
    }

    override public func executeAsync(_ foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        itemRemovalAlert.presentRemoveItemAlert(
            itemName: foodItem.name,
            success: { self.shoppingCart.removeFromCart(foodItem: foodItem, completion: completion) },
            cancel: { }
        )
    }
}
