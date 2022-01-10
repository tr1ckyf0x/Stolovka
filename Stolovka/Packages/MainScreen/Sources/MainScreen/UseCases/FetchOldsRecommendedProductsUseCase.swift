//
//  FetchOldsRecommendedProductsUseCase.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
import ProductModels
import OldsRecommendedProductsProvider

final class FetchOldsRecommendedProductsUseCase: AsyncUseCase<Void, [MainScreenProduct]> {

    private let oldsRecommendedProductsProvider: OldsRecommendedProductsProvider

    init(
        oldsRecommendedProductsProvider: OldsRecommendedProductsProvider
    ) {
        self.oldsRecommendedProductsProvider = oldsRecommendedProductsProvider
    }

    override func executeAsync(_ requestArgument: Argument, completion: @escaping (Result<[MainScreenProduct], Error>) -> Void) {
        oldsRecommendedProductsProvider.fetchOldsRecommendedProducts(completion: completion)
    }
}
