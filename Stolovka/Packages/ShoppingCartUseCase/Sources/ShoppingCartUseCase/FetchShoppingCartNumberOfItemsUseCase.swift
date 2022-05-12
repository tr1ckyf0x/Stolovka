//  Created by Nikita Shvad on 13.05.2022.
//

import Foundation
import UseCase
import Models
import Managers

public final class FetchShoppingCartNumberOfItemsUseCase: AsyncUseCase<[CountableContainer<FoodItem>], Void > {

    private let shoppingCart: ShoppingCartManagerProtocol

    public init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override public func executeAsync(_ requestArgument: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.displayNumberOfItems(shoppingCart: requestArgument, completion: completion)
    }
}
