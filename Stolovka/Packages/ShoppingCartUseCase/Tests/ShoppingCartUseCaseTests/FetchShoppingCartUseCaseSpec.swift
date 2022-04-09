//
//  FetchShoppingCartUseCaseSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
@testable import ShoppingCartUseCase
import Models

final class FetchShoppingCartUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerMock!
        var fetchShoppingCartUseCase: FetchShoppingCartUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerMock()
            fetchShoppingCartUseCase = FetchShoppingCartUseCase(shoppingCart: shoppingCartManagerMock)
        }

        describe("executeAsync(completion:)") {
            it("should call shoppingCartManagerMock.fetchCartItems(completion:)") {
                waitUntil { done in
                    fetchShoppingCartUseCase.executeAsync { _ in
                        done()
                    }
                }

                expect(shoppingCartManagerMock.didCallFetchCartItems).to(beTrue())
            }
        }
    }
}
