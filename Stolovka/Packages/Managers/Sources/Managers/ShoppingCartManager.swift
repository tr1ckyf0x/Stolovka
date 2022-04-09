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
    func fetchCartItems(completion: @escaping (Result<[ShoppingCartFoodItem], Error>) -> Void)
}

public final class ShoppingCartManager: ShoppingCartManagerProtocol {

    private var shoppingCartUnsorted: [FoodItem] = []
    private var shoppingCartSorted: [ShoppingCartFoodItem] = []

    public init() { }

    public func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        shoppingCartUnsorted.append(foodItem)
        completion(.success(Void()))
    }

    public func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Not Implemented")
    }

    public func fetchCartItems(completion: @escaping (Result<[ShoppingCartFoodItem], Error>) -> Void) {
        shoppingCartSorted = shoppingCartFoodItem(from: shoppingCartUnsorted)
        completion(.success(shoppingCartSorted))
    }

    private func shoppingCartFoodItem(from shoppingCartUnsorted: [FoodItem]) -> [ShoppingCartFoodItem] {
        let foodItemsByID = Dictionary(grouping: shoppingCartUnsorted) { (foodItem: FoodItem) -> String in
            foodItem.itemID
        }

        let shoppingCartSorted = foodItemsByID.values.compactMap { (foodItems: [FoodItem]) -> ShoppingCartFoodItem? in
            guard let foodItem = foodItems.first else { return nil }
            return ShoppingCartFoodItem(quantity: foodItems.count, shoppingCartFoodItem: foodItem)
        }

        return shoppingCartSorted
    }
}
