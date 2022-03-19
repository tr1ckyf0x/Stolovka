//
//  CategorizedFoodItems.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

public enum ProductCategory {
    case bakery
    case hot
    case fromYesterday
    case soup
    case desert
    case beverage
    
    public var title: String {
        switch self {
        case .bakery:
            return L10n.bakery
            
        case .hot:
            return L10n.hot
            
        case .fromYesterday:
            return L10n.fromYesterday
            
        case .soup:
            return L10n.soup
            
        case .desert:
            return L10n.desert
            
        case .beverage:
            return L10n.beverage
        }
    }
}

public struct CategorizedFoodItems {
    public let category: ProductCategory
    public let products: [FoodItem]

    public init(
        category: ProductCategory,
        products: [FoodItem]
    ) {
        self.category = category
        self.products = products
    }
}


