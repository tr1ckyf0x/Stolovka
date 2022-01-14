//
//  CategorizedItemProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

protocol CategorizedItemsProviderProtocol {
    func fetchCategorizedItems (completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

final class CategorizedItemsProvider: CategorizedItemsProviderProtocol {
    func fetchCategorizedItems(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        
        let categorizedFoodItems: [CategorizedFoodItems] = [
            
            CategorizedFoodItems(category: .bakery, products: [
                
                FoodItem(name: "Булочка", price: 5.00, description: "Былочка с присыпкой.", pictureUrl: .local(SharedResources.Asset.Assets.Products.bun), isLikedByUser: false, itemID: "113"),
                                    ]),
            
            CategorizedFoodItems(category: .fromYesterday, products: [
                FoodItem(name: "Каша Манная", price: 7.000, description: "Чуть теплая и комковатая. Как и твоя жизнь.", pictureUrl: .local(Asset.Assets.Products.semolinaPorrige), isLikedByUser: false, itemID: "114"),
                FoodItem(name: "Пюрешка с котлеткой", price: 10.000, description: "Уважаемая еда. Текстура великолепна.", pictureUrl: .local(Asset.Assets.Products.pyreshkaSKotletkoi), isLikedByUser: false, itemID: "115"),
            ]),
            
            CategorizedFoodItems(category: .hot, products: [
                FoodItem(name: "Гречка вегетарианская", price: 7.000, description: "Каждый годо дорожает", pictureUrl: .local(Asset.Assets.Products.buckwheat), isLikedByUser: false, itemID: "1114"),
                FoodItem(name: "Макарошки с чем-то", price: 23.000, description: "Скорее всего с курицей.", pictureUrl: .local(Asset.Assets.Products.pasta), isLikedByUser: false, itemID: "1116")
            ]),
            
            CategorizedFoodItems(category: .soup, products: [
                FoodItem(name: "Борщ красный", price: 9.000, description: "Красный горячий борщ", pictureUrl: .local(Asset.Assets.Products.borsh), isLikedByUser: false, itemID: "r3r3r")
            ]),
            
        ]
        
        completion(.success(categorizedFoodItems))
    }
}
