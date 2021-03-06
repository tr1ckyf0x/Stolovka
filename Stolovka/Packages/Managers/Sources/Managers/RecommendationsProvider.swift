//
//  RecommendationsProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources
import Models

// sourcery: AutoMockable
public protocol RecommendationsProviderProtocol {
    func fetchRecommendations(completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

public final class RecommendationsProvider {
    public init() { }
}

// MARK: - RecommendationsProviderProtocol
extension RecommendationsProvider: RecommendationsProviderProtocol {
    public func fetchRecommendations(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        let foodItems = [
            CategorizedFoodItems(
                category: .hot,
                products: [
                    FoodItem(
                        name: "Кофейный напиток",
                        price: 5.000,
                        description: "Хорошо идет под экзамены",
                        pictureUrl: .local(Asset.Assets.Products.cofeinyiNapitok),
                        isLikedByUser: false,
                        itemID: "coffee"
                    ),
                    FoodItem(
                        name: "Сосиска в тесте",
                        price: 12.000,
                        description: "Обыкновенная сосиска. Без сюпризов.",
                        pictureUrl: .local(Asset.Assets.Products.sosiskaVTeste),
                        isLikedByUser: false,
                        itemID: "sausage"
                    ),
                    FoodItem(
                        name: "Белый хлеб",
                        price: 0.33,
                        description: "Выгодная цена.",
                        pictureUrl: .local(Asset.Assets.Products.whiteBread),
                        isLikedByUser: false,
                        itemID: "bread"
                    )
                ]
            )
        ]
        completion(.success(foodItems))
    }
}
