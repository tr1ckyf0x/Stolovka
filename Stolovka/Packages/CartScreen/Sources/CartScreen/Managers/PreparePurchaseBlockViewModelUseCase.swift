//
//  PreparePurchaseBlockViewModelUseCase.swift
//  
//
//  Created by Nikita Shvad on 21.05.2022.
//

import Foundation
import UseCase
import Models

final class PreparePurchaseBlockViewModelUseCase: UseCase<[CountableContainer<FoodItem>], PurchaseBlockViewModel> {
    let calculateCartItemsUseCase: UseCase<[CountableContainer<FoodItem>], Int>
    let calculateTotalPriceUseCase: UseCase<[CountableContainer<FoodItem>], Double>

    init(
        calculateCartItemsUseCase: UseCase<[CountableContainer<FoodItem>], Int>,
        calculateTotalPriceUseCase: UseCase<[CountableContainer<FoodItem>], Double>
    ) {
        self.calculateCartItemsUseCase = calculateCartItemsUseCase
        self.calculateTotalPriceUseCase = calculateTotalPriceUseCase
    }

    override func execute(_ containers: [CountableContainer<FoodItem>]) -> PurchaseBlockViewModel {
        let totalPrice = calculateTotalPriceUseCase.execute(containers)
        let cartItemsNumber = calculateCartItemsUseCase.execute(containers)
        let viewModel = PurchaseBlockViewModel(quantity: cartItemsNumber, totalPrice: totalPrice)

        return viewModel
    }
}
