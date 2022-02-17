//
//  File.swift
//  
//
//  Created by Nikita Shvad on 18.02.2022.
//

import Foundation
import UseCase

class AddToCartUseCase: AsyncUseCase<FoodItem, Any> {
    var shoppingCart: ShoppingCartManagerProtocol
    
    init(shoppingCart: ShoppingCartManagerProtocol) {
        self.shoppingCart = shoppingCart
    }

    override func executeAsync(_ requestArgument: FoodItem, completion: @escaping (Result<Any, Error>) -> Void) {
        shoppingCart.addToCart(foodItem: requestArgument, completion: completion)
    }
}
