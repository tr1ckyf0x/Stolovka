//
//  File.swift
//  
//
//  Created by Nikita Shvad on 18.02.2022.
//

import Foundation

protocol ShoppingCartManagerProtocol {
    
    func addToCart (foodItem: FoodItem, completion: @escaping(Result<Any, Error>) -> Void)
    func removeFromCart(foodItem: FoodItem)
    func displayCartItems(foodItems: [FoodItem])
}

class ShoppingCartManager: ShoppingCartManagerProtocol {
    
    var shoppingCart: [FoodItem] = []
    
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Any, Error>) -> Void) {
        shoppingCart.append(foodItem)
        print("ShoppingCart Items are \(String(describing: shoppingCart))")
    }
    
    
    func removeFromCart(foodItem: FoodItem) {
        print("Not implemented")
    }
    
    func displayCartItems(foodItems: [FoodItem]) {
        print("Not implemented")
    }
    
    
}
