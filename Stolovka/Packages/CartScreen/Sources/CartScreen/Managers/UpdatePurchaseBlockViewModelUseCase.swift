//
//  UpdatePurchaseBlockUseCase.swift
//  
//
//  Created by Nikita Shvad on 21.05.2022.
//

import Foundation
import UseCase
import Models
import ShoppingCartUseCase

final class UpdatePurchaseBlockViewModelUseCase: UseCase<[CountableContainer<FoodItem>], PurchaseBlockViewModel> {
    let calculateCartItemsUseCase = CalculateCartItemsCountUseCase()
    let calculateTotalPriceUseCase = CalculateCartTotalPriceUseCase()

    override func execute(_ container: [CountableContainer<FoodItem>]) -> PurchaseBlockViewModel {
        let totalPrice = calculateTotalPriceUseCase.execute(container)
        let cartItemsNumber = calculateCartItemsUseCase.execute(container)
        let viewModel = PurchaseBlockViewModel(quantity: cartItemsNumber, totalPrice: totalPrice)

        return viewModel
    }
}
