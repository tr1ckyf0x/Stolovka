//
//  ShoppingCartFoodItem.swift
//  
//
//  Created by Nikita Shvad on 02.04.2022.
//

import Foundation

public struct ShoppingCartFoodItem {
    public var quantity: Int
    public let foodItem: FoodItem

    public init(
        quantity: Int,
        foodItem: FoodItem
    ) {
        self.quantity = quantity
        self.foodItem = foodItem
    }
}

extension ShoppingCartFoodItem: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(foodItem.itemID)
    }

    public static func == (lhs: ShoppingCartFoodItem, rhs: ShoppingCartFoodItem) -> Bool {
        lhs.foodItem.itemID == rhs.foodItem.itemID
    }
}
