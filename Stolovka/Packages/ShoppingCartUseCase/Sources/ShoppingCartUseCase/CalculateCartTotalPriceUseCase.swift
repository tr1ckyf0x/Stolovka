import Foundation
import UseCase
import Models

public final class CalculateCartTotalPriceUseCase: UseCase<[CountableContainer<FoodItem>], Double> {

    override public func execute(_ containers: [CountableContainer<FoodItem>]) -> Double {
        containers.reduce(0) { (partialResult: Double, container: CountableContainer<FoodItem>) -> Double in
            let result = partialResult + Double(container.quantity) * container.item.price
            return round(result * 100) / 100.0
        }
    }
}
