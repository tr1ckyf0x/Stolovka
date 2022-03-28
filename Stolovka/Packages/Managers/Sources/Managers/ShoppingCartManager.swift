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

    private var shoppingCart: [FoodItem] = []

    public init() { }

    public func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCart.append(foodItem)
        completion(.success(Void()))
    }

    public func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Not Implemented")
    }

    public func fetchCartItems(completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        completion(.success(shoppingCart))
    }
}
