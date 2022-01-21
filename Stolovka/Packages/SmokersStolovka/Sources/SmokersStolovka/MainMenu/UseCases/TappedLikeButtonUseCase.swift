//
//  File.swift
//  
//
//  Created by Nikita Shvad on 14.01.2022.
//

import Foundation
import UseCase

class TappedLikeButtonUseCase: AsyncUseCase<Void, [FoodItem]> {
    let foodItemCarouselManager: FoodItemCarouselManager
    
    init(foodItemCarouselManager: FoodItemCarouselManager) {
        self.foodItemCarouselManager = foodItemCarouselManager
    }
}



