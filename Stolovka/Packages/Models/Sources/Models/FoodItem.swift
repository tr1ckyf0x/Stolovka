//
//  FoodItem.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

public struct FoodItem {
    public var name: String
    public var price: Double
    public var description: String
    public var pictureUrl: PictureFormat
    public var isLikedByUser: Bool
    public var itemID: String

    public init(
        name: String,
        price: Double,
        description: String,
        pictureUrl: PictureFormat,
        isLikedByUser: Bool,
        itemID: String
    ) {
        self.name = name
        self.price = price
        self.description = description
        self.pictureUrl = pictureUrl
        self.isLikedByUser = isLikedByUser
        self.itemID = itemID
    }
}

extension FoodItem: Equatable {
    public static func == (lhs: FoodItem, rhs: FoodItem) -> Bool {
        lhs.itemID == rhs.itemID
    }
}
