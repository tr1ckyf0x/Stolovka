//
//  RemoveShoppingCartItemUseCaseSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
import ShoppingCartUseCase
import Models
import ManagersMock

final class RemoveShoppingCartItemUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerProtocolMock!
        var removeShoppingCartItemUseCase: RemoveShoppingCartItemUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerProtocolMock()
            removeShoppingCartItemUseCase = RemoveShoppingCartItemUseCase(shoppingCart: shoppingCartManagerMock)
        }

        describe("executeAsync(_:completion:)") {
            it("should call shoppingCartManagerMock.removeFromCart(foodItem:completion:)") {
                let foodItem = FoodItem(
                    name: "",
                    price: 0,
                    description: "",
                    pictureUrl: .test,
                    isLikedByUser: false,
                    itemID: ""
                )

                removeShoppingCartItemUseCase.executeAsync(foodItem) { _ in }

                expect(shoppingCartManagerMock.removeFromCartFoodItemCompletionCalled).to(beTrue())
            }
        }
    }
}
