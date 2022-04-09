//
//  AddToCartUseCaseSpec.swift
//
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
@testable import ShoppingCartUseCase
import Models

final class AddToCartUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerMock!
        var addToCartUseCase: AddToCartUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerMock()
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
                
                waitUntil { done in
                    addToCartUseCase.executeAsync(foodItem) { _ in
                        done()
                    }
                }

                expect(shoppingCartManagerMock.didCallAddToCart).to(beTrue())
            }
        }
    }
}
