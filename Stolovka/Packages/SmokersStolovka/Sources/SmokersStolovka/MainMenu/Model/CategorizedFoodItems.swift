//
//  CategorizedFoodItems.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SwiftUI

enum ProductCategory {
    case bakery
    case hot
    case fromYesterday
    case soup
    case desert
    case beverage
    
    var title: String {
        switch self {
        case .bakery:
            return "Выпечка"
            
        case .hot:
            return "Горячее"
            
        case .fromYesterday:
            return "Вчерашнее"
            
        case .soup:
            return "Жидкое"
            
        case .desert:
            return "Сладкое"
            
        case .beverage:
            return "Попить"
        }
    }
}

struct CategorizedFoodItems {
    let category: ProductCategory
    let products: [FoodItem]
}


