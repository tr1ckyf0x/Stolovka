//  Created by Nikita Shvad on 28.03.2022.
//

import Foundation
import UseCase
import Models
import Managers

public final class FetchShoppingCartUseCase: AsyncUseCase<Void, [CountableContainer<FoodItem>]> {

    private let shoppingCart: ShoppingCartManagerProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override public func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[CountableContainer<FoodItem>], Error>) -> Void) {
        shoppingCart.fetchCartItems(completion: completion)
    }
}
