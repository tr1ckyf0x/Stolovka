import Foundation
import UseCase
import Models
import Managers

public final class AddToCartUseCase: AsyncUseCase<FoodItem, Void> {
    private let shoppingCart: ShoppingCartManagerProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override public func executeAsync(_ requestArgument: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.addToCart(foodItem: requestArgument, completion: completion)
    }
}
