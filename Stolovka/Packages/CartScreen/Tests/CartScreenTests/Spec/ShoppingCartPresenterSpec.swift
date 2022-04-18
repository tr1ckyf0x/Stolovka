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

// swiftlint:disable function_body_length
// swiftlint:disable closure_body_length

final class StolovkaMainScreenPresenterSpec: QuickSpec {

    override func spec() {

        var sut: ShoppingCartPresenter!

        var shoppingCartControllerInputMock: ShoppingCartControllerInputMock!
        var shoppingCartTableViewManagerMock: ShoppingCartTableManagerProtocolMock!
        var fetchCartItemsUseCaseMock: AsyncUseCaseMock<Void, [CountableContainer<FoodItem>]>!
        var addToCartUseCaseMock: AsyncUseCaseMock<FoodItem, Void>!
        var removeFromCartUseCaseMock: AsyncUseCaseMock<FoodItem, Void>!

        beforeEach {
            sut = ShoppingCartPresenter()

            shoppingCartControllerInputMock = ShoppingCartControllerInputMock()
            shoppingCartTableViewManagerMock = ShoppingCartTableManagerProtocolMock()
            fetchCartItemsUseCaseMock = AsyncUseCaseMock()
            addToCartUseCaseMock = AsyncUseCaseMock()
            removeFromCartUseCaseMock = AsyncUseCaseMock()

            sut.viewController = shoppingCartControllerInputMock
            sut.shoppingCartTableViewManager = shoppingCartTableViewManagerMock
            sut.fetchCartItemsUseCase = fetchCartItemsUseCaseMock
            sut.addToCartUseCase = addToCartUseCaseMock
            sut.removeFromCartUseCase = removeFromCartUseCaseMock
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

        describe("view(_:didTapAddButtonFor:)") {
            let foodItem = FoodItem(
                name: "",
                price: 0,
                description: "",
                pictureUrl: .test,
                isLikedByUser: false,
                itemID: ""
            )

            let foodItemContainer = CountableContainer(item: foodItem, quantity: 1)

            it("Should call addToCartUseCase.executeAsync(_:)") {
                sut.view(shoppingCartControllerInputMock, didTapAddButtonFor: foodItemContainer)

                expect(addToCartUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            context("addToCartUseCase.executeAsync(_:) returns success") {

                beforeEach {
                    addToCartUseCaseMock.result = .success(Void())
                }

                it("should call fetchCartItemsUseCase.executeAsync()") {
                    sut.view(shoppingCartControllerInputMock, didTapAddButtonFor: foodItemContainer)

                    expect(fetchCartItemsUseCaseMock.didCallExecuteAsync).to(beTrue())
                }

                context("fetchCartItemsUseCase?.executeAsync() returns success") {

                    beforeEach {
                        fetchCartItemsUseCaseMock.result = .success([])
                    }

                    it("should call shoppingCartTableViewManager.setShoppingCartFoodItems(_:)") {
                        sut.view(shoppingCartControllerInputMock, didTapAddButtonFor: foodItemContainer)

                        expect(shoppingCartTableViewManagerMock.setShoppingCartFoodItemsCalled).to(beTrue())
                    }

                    it("should call viewController.reloadShoppingCartTableView()") {
                        sut.view(shoppingCartControllerInputMock, didTapAddButtonFor: foodItemContainer)

                        expect(shoppingCartControllerInputMock.reloadShoppingCartTableViewCalled).to(beTrue())
                    }
                }
            }
        }

        describe("view(_:didTapRemoveButtomFor:)") {
            let foodItem = FoodItem(
                name: "",
                price: 0,
                description: "",
                pictureUrl: .test,
                isLikedByUser: false,
                itemID: ""
            )

            let foodItemContainer = CountableContainer(item: foodItem, quantity: 1)

            it("should call removeFromCartUseCase.executeAsync(_:)") {
                sut.view(shoppingCartControllerInputMock, didTapRemoveButtonFor: foodItemContainer)

                expect(removeFromCartUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            context("removeFromCartUseCase?.executeAsync() returns success") {

                beforeEach {
                    removeFromCartUseCaseMock.result = .success(Void())
                }

                it("should call fetchCartItemsUseCase.executeAsync()") {
                    sut.view(shoppingCartControllerInputMock, didTapRemoveButtonFor: foodItemContainer)

                    expect(fetchCartItemsUseCaseMock.didCallExecuteAsync).to(beTrue())
                }
                context("fetchCartItemsUseCase.executeAsync() returns true") {

                    beforeEach {
                        fetchCartItemsUseCaseMock.result = .success([])
                    }

                    it("should call shoppingCartTableViewManager.setShoppingCartFoodItems(_:)") {
                        sut.view(shoppingCartControllerInputMock, didTapRemoveButtonFor: foodItemContainer)

                        expect(shoppingCartTableViewManagerMock.setShoppingCartFoodItemsCalled).to(beTrue())
                    }

                    it("should call viewController.reloadShoppingCartTableView()") {
                        sut.view(shoppingCartControllerInputMock, didTapRemoveButtonFor: foodItemContainer)

                        expect(shoppingCartControllerInputMock.reloadShoppingCartTableViewCalled).to(beTrue())
                    }
                }
            }
        }
    }
}
// swiftlint:enable function_body_length
// swiftlint:enable closure_body_length
