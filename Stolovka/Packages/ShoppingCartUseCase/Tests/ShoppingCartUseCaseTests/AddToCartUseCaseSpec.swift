//
//  AddToCartUseCaseSpec.swift
//
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
import ShoppingCartUseCase
import Models
import ManagersMock

final class AddToCartUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerProtocolMock!
        var addToCartUseCase: AddToCartUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerProtocolMock()
            addToCartUseCase = AddToCartUseCase(shoppingCart: shoppingCartManagerMock)
        }

        describe("executeAsync(_:completion:)") {
            it("should call shoppingCartManagerMock.addToCart(foodItem:completion:)") {
                let foodItem = FoodItem(
                    name: "",
                    price: 0,
                    description: "",
                    pictureUrl: .test,
                    isLikedByUser: false,
                    itemID: ""
                )

                addToCartUseCase.executeAsync(foodItem) { _ in }

                expect(shoppingCartManagerMock.addToCartFoodItemCompletionCalled).to(beTrue())
            }
        }
    }
}
