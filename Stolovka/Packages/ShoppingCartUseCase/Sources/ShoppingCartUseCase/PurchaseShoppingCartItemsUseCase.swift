
import Foundation
import UseCase
import Models
import Managers

public final class PurchaseShoppingCartItemsUseCase: AsyncUseCase<[CountableContainer<FoodItem>], Void > {

    private let shoppingCart: ShoppingCartManagerProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override public func executeAsync(_ requestArgument: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.purchaseShoppingCartFoodItems(shoppingCart: requestArgument, completion: completion)
    }
}
