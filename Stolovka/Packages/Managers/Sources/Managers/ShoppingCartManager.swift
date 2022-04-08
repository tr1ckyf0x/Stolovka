//
//  ShoppingCartManager.swift
//
//
//  Created by Nikita Shvad on 18.02.2022.
//

import Foundation
import UIKit
import Models

public protocol ShoppingCartManagerProtocol {
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchCartItems(completion: @escaping (Result<[FoodItem], Error>) -> Void)
}

public final class ShoppingCartManager: ShoppingCartManagerProtocol {

    private var shoppingCartUnsorted: [FoodItem] = []
    public init() { }

    public func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCartUnsorted.append(foodItem)
        for foodItem in shoppingCartUnsorted {
            
        }
        completion(.success(Void()))
    }

    public func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Not Implemented")
    }

    public func fetchCartItems(completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        completion(.success(shoppingCartUnsorted))
    }
}
