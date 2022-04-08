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
        var shoppingCartSorted: [ShoppingCartFoodItem] = []
        for foodItem in shoppingCartUnsorted {
            shoppingCartSorted.append(ShoppingCartFoodItem(quantity: 0, shoppingCartFoodItem: foodItem))
        }

        for foodItem in shoppingCartSorted {
            for itemNumber in 0...shoppingCartSorted.count - 1  where foodItem.shoppingCartFoodItem.itemID == shoppingCartSorted[itemNumber].shoppingCartFoodItem.itemID {
                shoppingCartSorted[itemNumber].quantity += 1
            }
        }
        return shoppingCartSorted.uniqued()
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
