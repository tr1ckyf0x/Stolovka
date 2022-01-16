//
//  File.swift
//  
//
//  Created by Nikita Shvad on 16.01.2022.
//

import Foundation
import SmokersStolovka



protocol ShoppingCartManagerProtocol {
    func updateShoppingCart(categorizedProduct: [CategorizedFoodItems])
    func addItemToShoppingCart(_ item: [CategorizedFoodItems])
    func removeItemFromShoppingCart(at indexPath: IndexPath)
}

class ShoppingCartManager {
    var categorizedFoodItems: [] = []
}


extension ShoppingCartManager: ShoppingCartManagerProtocol {
    func updateShoppingCart(categorizedProduct: [CategorizedFoodItems]) {
        <#code#>
    }
    
    
}
