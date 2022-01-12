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
    func fetchRecommendations (completion: @escaping(Result<[FoodItem], Error>) -> Void)
}

final class RecommendationsProvider: RecommendationsProviderProtocol {
    func fetchRecommendations(completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        let foodItems = [
            FoodItem(name: "Сосиска в тесте", price: 12.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste)),
            FoodItem(name: "Кофейный Напиток", price: 5.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.cofeinyiNapitok)),
            FoodItem(name: "Кофейный Напиток", price: 5.000, pictureUrl: .local(SharedResources.Asset.Assets.Products.cofeinyiNapitok))
        ]
        
        completion(.success(foodItems))
    }
    
    
}
