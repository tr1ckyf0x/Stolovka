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
            CategorizedFoodItems(category: .bakery, products:
                                    [FoodItem(name: "Сосиска в тесте", price: 12.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste), isLikedByUser: false, itemID: "112"),
                                     FoodItem(name: "Сосиска с Кошкой", price: 3.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste), isLikedByUser: true, itemID: "113"),
                                     FoodItem(name: "Сосиска с Тестом", price: 14.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste), isLikedByUser: false, itemID: "114"),
                                    ]),
            CategorizedFoodItems(category: .fromYesterday, products: [
                FoodItem(name: "Вчерашние Ноги", price: 15.300, pictureUrl: .local(SharedResources.Asset.Assets.Products.pyreshkaSKotletkoi), isLikedByUser: false, itemID: "101"),
                FoodItem(name: "Горловой Ком", price: 14.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.pyreshkaSKotletkoi), isLikedByUser: false, itemID: "102"),
            ]),
            CategorizedFoodItems(category: .hot, products: [
                FoodItem(name: "Горячий Влад", price: 999.99, pictureUrl: .local(SharedResources.Asset.Assets.Products.cofeinyiNapitok), isLikedByUser: false, itemID: "999"),
            ])
            ]
        
        completion(.success(categorizedFoodItems))
    }
}
