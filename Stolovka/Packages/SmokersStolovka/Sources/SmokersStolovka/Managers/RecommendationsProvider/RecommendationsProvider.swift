//
//  RecommendationsProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

protocol RecommendationsProviderProtocol {
    func fetchRecommendations (completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

final class RecommendationsProvider: RecommendationsProviderProtocol {
    func fetchRecommendations(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        let foodItems = [
            CategorizedFoodItems(category: .bakery, products: [
                FoodItem(name: "Сосиска в тесте", price: 12.000, pictureUrl: .local(Asset.Assets.Products.sosiskaVTeste)),
                FoodItem(name: "Кофейный напиток", price: 5.000, pictureUrl: .local(Asset.Assets.Products.cofeinyiNapitok)),
                FoodItem(name: "Пюрешка с котлеткой", price: 24.000, pictureUrl: .local(Asset.Assets.Products.pyreshkaSKotletkoi))
            ])
        ]
        
        completion(.success(foodItems))
    }
    
    
}
