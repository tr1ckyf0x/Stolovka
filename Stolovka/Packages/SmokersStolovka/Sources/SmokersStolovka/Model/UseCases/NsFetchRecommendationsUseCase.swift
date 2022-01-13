//
//  NsFetchRecommendationsUseCase.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase

class NsFetchRecommendationsUseCase: AsyncUseCase<Void, [FoodItem]> {
    let recommendationsProvider: RecommendationsProviderProtocol
    
    init(recommendationsProvider: RecommendationsProviderProtocol) {
        self.recommendationsProvider = recommendationsProvider
    }
    
    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        recommendationsProvider.fetchRecommendations(completion: completion)
    }
}