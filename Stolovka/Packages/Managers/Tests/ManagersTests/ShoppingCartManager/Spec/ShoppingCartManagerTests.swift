//
//  ShoppingCartManagerTests.swift
//  
//
//  Created by Vladislav Lisianskii on 10.04.2022.
//

// swiftlint:disable function_body_length
// swiftlint:disable closure_body_length
import Foundation
import Quick
import Nimble
import Models
@testable import Managers

final class ShoppingCartManagerTests: QuickSpec {

    override func spec() {

        var sut: ShoppingCartManager!

        beforeEach {
            sut = ShoppingCartManager()
        }

        describe("addToCart(foodItem:completion:)") {
            context("empty cart") {
                it("should add one container with one item") {
                    let foodItem = FoodItem(
                        name: "",
                        price: 0,
                        description: "",
                        pictureUrl: .test,
                        isLikedByUser: false,
                        itemID: ""
                    )

                    waitUntil { done in
                        sut.addToCart(foodItem: foodItem) { _ in
                            done()
                        }
                    }

                    waitUntil { done in
                        sut.fetchCartItems { (result: Result<[CountableContainer<FoodItem>], Error>) in
                            defer { done() }
                            switch result {
                            case let .success(foodItemContainers):
                                expect(foodItemContainers.count).to(equal(1))
                                expect(foodItemContainers.first?.quantity).to(equal(1))
                                expect(foodItemContainers.first?.item).to(equal(foodItem))

                            case let .failure(error):
                                fail(error.localizedDescription)
                            }
                        }
                    }
                }
            }

            context("cart has one food item") {
                let foodItem = FoodItem(
                    name: "",
                    price: 0,
                    description: "",
                    pictureUrl: .test,
                    isLikedByUser: false,
                    itemID: ""
                )

                beforeEach {
                    waitUntil { done in
                        sut.addToCart(foodItem: foodItem) { _ in done() }
                    }
                }

                it("should increase quantity") {
                    waitUntil { done in
                        sut.addToCart(foodItem: foodItem) { _ in
                            done()
                        }
                    }

                    waitUntil { done in
                        sut.fetchCartItems { (result: Result<[CountableContainer<FoodItem>], Error>) in
                            defer { done() }
                            switch result {
                            case let .success(foodItemContainers):
                                expect(foodItemContainers.count).to(equal(1))
                                expect(foodItemContainers.first?.quantity).to(equal(2))
                                expect(foodItemContainers.first?.item).to(equal(foodItem))

                            case let .failure(error):
                                fail(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }

        describe("removeFromCart(foodItem:completion:)") {
            context("cart has two food items") {
                let foodItem = FoodItem(
                    name: "",
                    price: 0,
                    description: "",
                    pictureUrl: .test,
                    isLikedByUser: false,
                    itemID: ""
                )

                beforeEach {
                    waitUntil { done in
                        sut.addToCart(foodItem: foodItem) { _ in done() }
                    }

                    waitUntil { done in
                        sut.addToCart(foodItem: foodItem) { _ in done() }
                    }
                }

                it("should decrease quantity") {
                    waitUntil { done in
                        sut.removeFromCart(foodItem: foodItem) { _ in
                            done()
                        }
                    }

                    waitUntil { done in
                        sut.fetchCartItems { (result: Result<[CountableContainer<FoodItem>], Error>) in
                            defer { done() }
                            switch result {
                            case let .success(foodItemContainers):
                                expect(foodItemContainers.count).to(equal(1))
                                expect(foodItemContainers.first?.quantity).to(equal(1))
                                expect(foodItemContainers.first?.item).to(equal(foodItem))

                            case let .failure(error):
                                fail(error.localizedDescription)
                            }
                        }
                    }
                }
            }

            context("cart is empty") {
                it("should return itemNotExists error") {
                    let foodItem = FoodItem(
                        name: "",
                        price: 0,
                        description: "",
                        pictureUrl: .test,
                        isLikedByUser: false,
                        itemID: ""
                    )

                    waitUntil { done in
                        sut.removeFromCart(foodItem: foodItem) { (result: Result<Void, Error>) in
                            defer { done() }
                            switch result {
                            case .success:
                                fail("Cart should return error if item does not exist")

                            case let .failure(error):
                                let error = error as? ShoppingCartManager.CartManagerError
                                if case let .itemNotExists(item) = error {
                                    expect(item).to(equal(foodItem))
                                } else {
                                    fail("itemNotExists error was expected")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
