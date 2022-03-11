
import Foundation
import UseCase

class AddToCartUseCase: AsyncUseCase<FoodItem, Void> {
    private let shoppingCart: ShoppingCartManagerProtocol
    
    init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override func executeAsync(_ requestArgument: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.addToCart(foodItem: requestArgument, completion: completion)
    }
}
