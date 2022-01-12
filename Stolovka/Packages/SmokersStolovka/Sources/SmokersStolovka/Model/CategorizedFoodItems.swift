//
//  CategorizedFoodItems.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

enum ProductCategory {
    case bakery
    case hot
    case fromYesterday
 
    var title: String {
        switch self {
        case .bakery:
            return "Выпечка" 
 
        case .hot:
            return "Горячее"
 
        case .fromYesterday:
            return "Вчерашнее"
        }
    }
}

struct CategorizedFoodItems {
    let category: ProductCategory
        let products: [FoodItem]
}


