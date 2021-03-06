//
//  FetchCategorizedItemsUseCase.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import Models
import UseCase
import Managers

final class FetchCategorizedItemsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]> {
    private let categorizedItemsProvider: CategorizedItemsProviderProtocol

    init(categorizedItemsProvider: CategorizedItemsProviderProtocol) {
        self.categorizedItemsProvider = categorizedItemsProvider
    }

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        categorizedItemsProvider.fetchCategorizedItems(completion: completion)
    }
}
