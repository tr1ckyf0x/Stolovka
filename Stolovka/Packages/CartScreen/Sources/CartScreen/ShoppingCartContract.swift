//  Created by Nikita Shvad on 20.03.2022.
//

import Models

// sourcery: AutoMockable
protocol ShoppingCartControllerInput: AnyObject {
    func reloadShoppingCartTableView()
    func configurePurchaseBlock(with viewModel: PurchaseBlockViewModel)
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

    func viewDidTapPurchaseButton(
        _ view: ShoppingCartControllerInput
    )
}

// sourcery: AutoMockable
protocol ShoppingCartTableManagerProtocol: AnyObject {
    func setShoppingCartFoodItems(_ shoppingCartFoodItems: [CountableContainer<FoodItem>])
}
