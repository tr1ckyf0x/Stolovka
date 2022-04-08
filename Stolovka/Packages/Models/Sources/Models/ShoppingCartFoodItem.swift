//
//  File.swift
//  
//
//  Created by Nikita Shvad on 02.04.2022.
//

import Foundation

public struct ShoppingCartFoodItem {
    public var quantity: Int
    public let shoppingCartFoodItem: FoodItem

    public init(
        quantity: Int,
        shoppingCartFoodItem: FoodItem
    ) {
        self.quantity = quantity
        self.shoppingCartFoodItem = shoppingCartFoodItem
        }

}

extension ShoppingCartFoodItem: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(shoppingCartFoodItem.itemID)
    }

    public static func == (lhs: ShoppingCartFoodItem, rhs: ShoppingCartFoodItem) -> Bool {
         lhs.shoppingCartFoodItem.itemID == rhs.shoppingCartFoodItem.itemID
    }
}
