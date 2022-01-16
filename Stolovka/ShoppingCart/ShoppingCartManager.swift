//
//  File.swift
//  
//
//  Created by Nikita Shvad on 16.01.2022.
//

import Foundation

protocol ShoppingCartManagerProtocol {
    func updateShoppingCart(categorizedProduct: [CategorizedFoodItems])
}

class ShoppingCartManager {
    var categorizedFoodItems: [CategorizedFoodItems]?
}


extension ShoppingCartManager: ShoppingCartManagerProtocol {
    func updateShoppingCart(categorizedProduct: [CategorizedFoodItems]) {
        <#code#>
    }
    
    
}
