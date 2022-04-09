//
//  RemoveShoppingCartItemUseCaseSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
@testable import ShoppingCartUseCase
import Models

final class RemoveShoppingCartItemUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerMock!
        var removeShoppingCartItemUseCase: RemoveShoppingCartItemUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerMock()
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

                waitUntil { done in
                    removeShoppingCartItemUseCase.executeAsync(foodItem) { _ in
                        done()
                    }
                }

                expect(shoppingCartManagerMock.didCallRemoveFromCart).to(beTrue())
            }
        }
    }
}
