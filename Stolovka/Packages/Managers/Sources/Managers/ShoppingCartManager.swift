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
    private var items: [ShoppingCartFoodItem] = []

    public init() { }

    public func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        let index = items.firstIndex { (shoppingCartFoodItem: ShoppingCartFoodItem) -> Bool in
            shoppingCartFoodItem.foodItem == foodItem
        }

        if let index = index {
            items[index].quantity += 1
        } else {
            items.append(ShoppingCartFoodItem(quantity: 1, foodItem: foodItem))
        }

        completion(.success(Void()))
    }

    public func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        let index = items.firstIndex { (shoppingCartFoodItem: ShoppingCartFoodItem) -> Bool in
            shoppingCartFoodItem.foodItem == foodItem
        }

        guard let index = index else {
            completion(.failure(CartManagerError.itemNotExists(foodItem)))
            return
        }

        items[index].quantity -= 1

        if items[index].quantity == 0 {
            items.remove(at: index)
        }

        completion(.success(Void()))
    }

    public func fetchCartItems(completion: @escaping (Result<[ShoppingCartFoodItem], Error>) -> Void) {
        completion(.success(items))
    }
}

extension ShoppingCartManager {
    enum CartManagerError: Error {
        case itemNotExists(FoodItem)
    }
}
