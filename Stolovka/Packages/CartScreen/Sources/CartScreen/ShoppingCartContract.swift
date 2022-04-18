//  Created by Nikita Shvad on 20.03.2022.
//

import Models

// sourcery: AutoMockable
protocol ShoppingCartControllerInput: AnyObject {
    func reloadShoppingCartTableView()
}

protocol ShoppingCartControllerOutput: AnyObject {
    func viewDidLoad(_ view: ShoppingCartControllerInput)
    func view(
        _ view: ShoppingCartControllerInput,
        didTapAddButtonFor foodItem: CountableContainer<FoodItem>
    )
    func view(
        _ view: ShoppingCartControllerInput,
        didTapRemoveButtonFor foodItem: CountableContainer<FoodItem>
    )
}

// sourcery: AutoMockable
protocol ShoppingCartTableManagerProtocol: AnyObject {
    func setShoppingCartFoodItems(_ shoppingCartFoodItems: [CountableContainer<FoodItem>])
}
