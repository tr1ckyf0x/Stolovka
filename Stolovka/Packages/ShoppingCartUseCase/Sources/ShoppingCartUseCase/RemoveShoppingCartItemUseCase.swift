import Foundation
import Models
import Managers
import UseCase

public final class RemoveShoppingCartItemUseCase: AsyncUseCase<FoodItem, Void> {

    private let shoppingCart: ShoppingCartManagerProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override public func executeAsync(_ foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.removeFromCart(foodItem: foodItem, completion: completion)
    }
}
