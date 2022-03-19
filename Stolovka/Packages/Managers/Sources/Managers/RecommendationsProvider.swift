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

public protocol RecommendationsProviderProtocol {
    func fetchRecommendations (completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

public final class RecommendationsProvider: RecommendationsProviderProtocol {
    public init() {
    }

    public func fetchRecommendations(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        let foodItems = [
            CategorizedFoodItems(category: .hot, products: [
                FoodItem(name: "Кофейный напиток", price: 5.000, description: "Хорошо идет под экзамены", pictureUrl: .local(Asset.Assets.Products.cofeinyiNapitok), isLikedByUser: false, itemID: "11123"),
                FoodItem(name: "Сосиска в тесте", price: 12.000, description: "Обыкновенная сосиска. Без сюпризов.", pictureUrl: .local(Asset.Assets.Products.sosiskaVTeste), isLikedByUser: false, itemID: "1118"),
                FoodItem.init(name: "Белый хлеб", price: 0.33, description: "Выгодная цена.", pictureUrl: .local(Asset.Assets.Products.whiteBread), isLikedByUser: false, itemID: "111156")
            ])
        ]
        completion(.success(foodItems))
    }
}
