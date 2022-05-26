//  Created by Nikita Shvad on 13.05.2022.
//

import Foundation
import UseCase
import Models

public final class CalculateCartItemsCountUseCase: UseCase<[CountableContainer<FoodItem>], Int> {

    override public func execute(_ containers: [CountableContainer<FoodItem>]) -> Int {
        containers
            .map(\.quantity)
            .reduce(0, +)
    }
}
