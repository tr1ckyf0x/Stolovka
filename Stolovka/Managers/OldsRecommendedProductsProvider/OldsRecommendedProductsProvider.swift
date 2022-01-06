//
//  OldsRecommendedProductsProvider.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

protocol OldsRecommendedProductsProvider: AnyObject {
    func fetchOldsRecommendedProducts(completion: @escaping (Result<[MainScreenProduct], Error>) -> Void)
}

final class DumbOldsRecommendedProductsProvider: OldsRecommendedProductsProvider {
    func fetchOldsRecommendedProducts(completion: @escaping (Result<[MainScreenProduct], Error>) -> Void) {
        let products = [
            MainScreenProduct(name: "Сосиска в тесте", price: 15.0, image: .local(Asset.Assets.Products.sosiskaVTeste)),
            MainScreenProduct(name: "Кофейный напиток", price: 10, image: .local(Asset.Assets.Products.cofeinyiNapitok)),
            MainScreenProduct(name: "Пюрешка с котлеткой", price: 50, image: .local(Asset.Assets.Products.pyreshkaSKotletkoi))
        ]

        completion(.success(products))
    }
}
