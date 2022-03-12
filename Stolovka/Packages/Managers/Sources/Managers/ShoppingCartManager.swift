//
//  ShoppingCartManager.swift
//  
//
//  Created by Nikita Shvad on 18.02.2022.
//

import Foundation
import UIKit
import Models

protocol ShoppingCartManagerProtocol {
    
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchCartItems(completion: @escaping (Result<[FoodItem], Error>) -> Void)
}

class ShoppingCartManager: ShoppingCartManagerProtocol {
    
    private var shoppingCart: [FoodItem] = []
    
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.append(foodItem)
        completion(.success(Void()))
        print("ShoppingCart Items are \(String(describing: shoppingCart))")
    }

    func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Not Implemented")
    }
    
    func fetchCartItems(completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        print("Not Implemented")
    }
}
