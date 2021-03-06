//
//  CalculateCartTotalPriceUseCase.swift
//  
//
//  Created by Nikita Shvad on 21.05.2022.
//

import Foundation
import UseCase
import Models

public final class CalculateCartTotalPriceUseCase: UseCase<[CountableContainer<FoodItem>], Double> {

    override public func execute(_ containers: [CountableContainer<FoodItem>]) -> Double {
        containers.reduce(0) { (partialResult: Double, container: CountableContainer<FoodItem>) -> Double in
            partialResult + Double(container.quantity) * container.item.price
        }
    }
}
