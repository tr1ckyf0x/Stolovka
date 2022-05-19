//
//  ShoppingCartManager.swift
//
//
//  Created by Nikita Shvad on 18.02.2022.
//

import Foundation
import UIKit
import Models
// TODO: notification "are you sure you want to remove the item?" when items[index].quatity == 0

// sourcery: AutoMockable
public protocol ShoppingCartManagerProtocol {
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchCartItems(completion: @escaping (Result<[CountableContainer<FoodItem>], Error>) -> Void)
    func displayNumberOfItems(shoppingCart: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void)
    func purchaseShoppingCartFoodItems(shoppingCart: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void)
}

final class ShoppingCartManager {
    private var items: [CountableContainer<FoodItem>] = []
    private var numberOfItems: Int = 0

    init() { }
}

// MARK: - ShoppingCartManagerProtocol
extension ShoppingCartManager: ShoppingCartManagerProtocol {
    func purchaseShoppingCartFoodItems(shoppingCart: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void) {
        print("Purchased")
    }

    func displayNumberOfItems(shoppingCart: [CountableContainer<FoodItem>], completion: @escaping (Result<Void, Error>) -> Void) {
        for item in shoppingCart {
            numberOfItems += item.quantity
        }
    }

    public func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        let index = items.firstIndex { (shoppingCartFoodItem: CountableContainer<FoodItem>) -> Bool in
            shoppingCartFoodItem.item == foodItem
        }

        if let index = index {
            items[index].quantity += 1
        } else {
            items.append(CountableContainer(item: foodItem, quantity: 1))
        }

        completion(.success(Void()))
    }

    public func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        let index = items.firstIndex { (shoppingCartFoodItem: CountableContainer<FoodItem>) -> Bool in
            shoppingCartFoodItem.item == foodItem
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

    public func fetchCartItems(completion: @escaping (Result<[CountableContainer<FoodItem>], Error>) -> Void) {
        completion(.success(items))
    }
}

extension ShoppingCartManager {
    enum CartManagerError: Error {
        case itemNotExists(FoodItem)
    }
}
