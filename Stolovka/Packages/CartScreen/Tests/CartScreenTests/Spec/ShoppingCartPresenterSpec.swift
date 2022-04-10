//
//  ShoppingCartPresenterSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 10.04.2022.
//

import Foundation
import Quick
import Nimble
import UseCaseMock
import Models
@testable import CartScreen

final class StolovkaMainScreenPresenterSpec: QuickSpec {

    override func spec() {

        var sut: ShoppingCartPresenter!

        var shoppingCartControllerInputMock: ShoppingCartControllerInputMock!
        var shoppingCartTableViewManagerMock: ShoppingCartTableManagerProtocolMock!
        var fetchCartItemsUseCaseMock: AsyncUseCaseMock<Void, [CountableContainer<FoodItem>]>!

        beforeEach {
            sut = ShoppingCartPresenter()

            shoppingCartControllerInputMock = ShoppingCartControllerInputMock()
            shoppingCartTableViewManagerMock = ShoppingCartTableManagerProtocolMock()
            fetchCartItemsUseCaseMock = AsyncUseCaseMock()

            sut.viewController = shoppingCartControllerInputMock
            sut.shoppingCartTableViewManager = shoppingCartTableViewManagerMock
            sut.fetchCartItemsUseCase = fetchCartItemsUseCaseMock
        }

        describe("viewDidLoad(_:)") {
            it("should call fetchCartItemsUseCase.executeAsync()") {
                sut.viewDidLoad(shoppingCartControllerInputMock)

                expect(fetchCartItemsUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            context("fetchCartItemsUseCase result is success") {
                beforeEach {
                    let foodItem = FoodItem(
                        name: "",
                        price: 0,
                        description: "",
                        pictureUrl: .test,
                        isLikedByUser: false,
                        itemID: ""
                    )

                    let result = [CountableContainer<FoodItem>(item: foodItem, quantity: 1)]
                    fetchCartItemsUseCaseMock.result = .success(result)
                }

                it("should call recommendationsCollectionManager.setFoodItems(_:)") {
                    sut.viewDidLoad(shoppingCartControllerInputMock)

                    expect(shoppingCartTableViewManagerMock.setShoppingCartFoodItemsCalled).to(beTrue())
                }

                it("should call viewController.reloadShoppingCartTableView()") {
                    sut.viewDidLoad(shoppingCartControllerInputMock)

                    expect(shoppingCartControllerInputMock.reloadShoppingCartTableViewCalled).to(beTrue())
                }
            }
        }
    }
}
