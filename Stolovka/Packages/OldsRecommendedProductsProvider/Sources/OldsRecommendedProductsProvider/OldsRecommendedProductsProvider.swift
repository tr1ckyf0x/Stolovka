//
//  OldsRecommendedProductsProvider.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources
import ProductModels

public protocol OldsRecommendedProductsProvider: AnyObject {
    func fetchOldsRecommendedProducts(completion: @escaping (Result<[MainScreenProduct], Error>) -> Void)
}

public final class DumbOldsRecommendedProductsProvider: OldsRecommendedProductsProvider {
    public func fetchOldsRecommendedProducts(completion: @escaping (Result<[MainScreenProduct], Error>) -> Void) {
        let products = [
            MainScreenProduct(name: "Сосиска в тесте", price: 15.0, image: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste)),
            MainScreenProduct(name: "Кофейный напиток", price: 10, image: .local(SharedResources.Asset.Assets.Products.sosiskaVTeste)),
            MainScreenProduct(name: "Пюрешка с котлеткой", price: 50, image: .local(SharedResources.Asset.Assets.Products.pyreshkaSKotletkoi))
        ]

        completion(.success(products))
    }
}
