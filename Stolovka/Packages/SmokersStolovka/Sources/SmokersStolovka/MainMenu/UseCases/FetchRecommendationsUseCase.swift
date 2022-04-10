//
//  FetchRecommendationsUseCase.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
import Models
import Managers

final class FetchRecommendationsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]> {
    private let recommendationsProvider: RecommendationsProviderProtocol

    init(recommendationsProvider: RecommendationsProviderProtocol) {
        self.recommendationsProvider = recommendationsProvider
    }

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        recommendationsProvider.fetchRecommendations(completion: completion)
    }
}
