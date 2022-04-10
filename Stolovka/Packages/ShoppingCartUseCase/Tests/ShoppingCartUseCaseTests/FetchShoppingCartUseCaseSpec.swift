//
//  FetchShoppingCartUseCaseSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Quick
import Nimble
import ShoppingCartUseCase
import Models
import ManagersMock

final class FetchShoppingCartUseCaseSpec: QuickSpec {

    override func spec() {
        var shoppingCartManagerMock: ShoppingCartManagerProtocolMock!
        var fetchShoppingCartUseCase: FetchShoppingCartUseCase!

        beforeEach {
            shoppingCartManagerMock = ShoppingCartManagerProtocolMock()
            fetchShoppingCartUseCase = FetchShoppingCartUseCase(shoppingCart: shoppingCartManagerMock)
        }

        describe("executeAsync(completion:)") {
            it("should call shoppingCartManagerMock.fetchCartItems(completion:)") {
                fetchShoppingCartUseCase.executeAsync { _ in }

                expect(shoppingCartManagerMock.fetchCartItemsCompletionCalled).to(beTrue())
            }
        }
    }
}
