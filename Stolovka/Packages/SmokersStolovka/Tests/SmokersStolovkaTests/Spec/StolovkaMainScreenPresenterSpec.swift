//
//  StolovkaMainScreenPresenterSpec.swift
//  
//
//  Created by Vladislav Lisianskii on 10.04.2022.
//

// swiftlint:disable function_body_length
// swiftlint:disable closure_body_length
// swiftlint:disable identifier_name
import Foundation
import Quick
import Nimble
import UseCaseMock
import Models
@testable import SmokersStolovka

final class StolovkaMainScreenPresenterSpec: QuickSpec {

    override func spec() {

        var presenter: StolovkaMainScreenPresenter!

        var viewControllerInputMock: MainScreenControllerInputMock!
        var routerMock: MainScreenRouterProtocolMock!

        var fetchGreetingUseCaseMock: UseCaseMock<Void, ChumBucketGreetingModel>!
        var recommendationsUseCaseMock: AsyncUseCaseMock<Void, [CategorizedFoodItems]>!
        var addToCartUseCaseMock: AsyncUseCaseMock<FoodItem, Void>!
        var fetchCategorizedItemsUseCaseMock: AsyncUseCaseMock<Void, [CategorizedFoodItems]>!

        var recommendationsCollectionManagerMock: MainScreenFoodItemsCollectionManagerProtocolMock!
        var categorizedFoodItemsCollectionManagerMock: MainScreenFoodItemsCollectionManagerProtocolMock!
        var itemCategoryCollectionManagerMock: MainScreenItemCategoryProtocolMock!

        beforeEach {
            presenter = StolovkaMainScreenPresenter()
            viewControllerInputMock = MainScreenControllerInputMock()
            routerMock = MainScreenRouterProtocolMock()

            fetchGreetingUseCaseMock = UseCaseMock()
            recommendationsUseCaseMock = AsyncUseCaseMock()
            addToCartUseCaseMock = AsyncUseCaseMock()
            fetchCategorizedItemsUseCaseMock = AsyncUseCaseMock()

            recommendationsCollectionManagerMock = MainScreenFoodItemsCollectionManagerProtocolMock()
            categorizedFoodItemsCollectionManagerMock = MainScreenFoodItemsCollectionManagerProtocolMock()
            itemCategoryCollectionManagerMock = MainScreenItemCategoryProtocolMock()

            presenter.viewController = viewControllerInputMock
            presenter.router = routerMock
            presenter.fetchGreetingUseCase = fetchGreetingUseCaseMock
            presenter.recommendationsUseCase = recommendationsUseCaseMock
            presenter.addToCartUseCase = addToCartUseCaseMock
            presenter.fetchCategorizedItemsUseCase = fetchCategorizedItemsUseCaseMock
            presenter.recommendationsCollectionManager = recommendationsCollectionManagerMock
            presenter.categorizedFoodItemsCollectionManager = categorizedFoodItemsCollectionManagerMock
            presenter.itemCategoryCollectionManager = itemCategoryCollectionManagerMock
        }

        describe("viewDidLoad(_:)") {
            beforeEach {
                fetchGreetingUseCaseMock.result = ChumBucketGreetingModel(
                    greeting: "",
                    quoteOfTheDay: ""
                )
            }

            it("should call fetchGreetingUseCase.execute()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(fetchGreetingUseCaseMock.didCallExecute).to(beTrue())
            }

            it("should call viewController.setGreeting(model:)") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(viewControllerInputMock.setGreetingModelCalled).to(beTrue())
            }

            it("should call fetchRecommendations()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(recommendationsUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            context("recommendationsUseCase returns success") {
                beforeEach {
                    recommendationsUseCaseMock.result = .success([])
                }

                it("should call recommendationsCollectionManager.setFoodItems(_:)") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(recommendationsCollectionManagerMock.setFoodItemsCalled).to(beTrue())
                }

                it("should call viewController.reloadRecommendationsCollection()") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(viewControllerInputMock.reloadRecommendationsCollectionCalled).to(beTrue())
                }
            }

            it("should call fetchCategorizedItemsUseCase.executeAsync()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(fetchCategorizedItemsUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            context("fetchCategorizedItemsUseCase returns success") {
                beforeEach {
                    fetchCategorizedItemsUseCaseMock.result = .success([])
                }

                it("should call categorizedFoodItemsCollectionManager.setFoodItems(_:)") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(categorizedFoodItemsCollectionManagerMock.setFoodItemsCalled).to(beTrue())
                }

                it("should call itemCategoryCollectionManager.setupItemCategories(_:)") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(itemCategoryCollectionManagerMock.setupItemCategoriesCalled).to(beTrue())
                }

                it("should call viewController.reloadRecommendationsCollection()") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(viewControllerInputMock.reloadRecommendationsCollectionCalled).to(beTrue())
                }

                it("should call viewController.reloadRecommendationsTitles()") {
                    presenter.viewDidLoad(viewControllerInputMock)

                    expect(viewControllerInputMock.reloadRecommendationsTitlesCalled).to(beTrue())
                }
            }

            it("should call viewController.loadViews()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(viewControllerInputMock.loadViewsCalled).to(beTrue())
            }

            it("should call viewController.reloadRecommendationsTitles()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(viewControllerInputMock.reloadRecommendationsTitlesCalled).to(beTrue())
            }

            it("should call viewController.reloadRecommendationsCollection()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(viewControllerInputMock.reloadRecommendationsCollectionCalled).to(beTrue())
            }

            it("should call viewController.reloadCategorizedItemsCollection()") {
                presenter.viewDidLoad(viewControllerInputMock)

                expect(viewControllerInputMock.reloadCategorizedItemsCollectionCalled).to(beTrue())
            }
        }

        describe("view(_:didTapAddButtonFor:)") {
            it("should call addToCartUseCase.executeAsync(_:)") {
                let foodItem = FoodItem(
                    name: "",
                    price: 0,
                    description: "",
                    pictureUrl: .test,
                    isLikedByUser: false,
                    itemID: ""
                )

                presenter.view(viewControllerInputMock, didTapAddButtonFor: foodItem)

                expect(addToCartUseCaseMock.didCallExecuteAsync).to(beTrue())
            }
        }

        describe("view(_:didTapLikeButtonFor:)") {
        }

        describe("viewDidTapShoppingCart(_:)") {
            it("should call router.routeToShoppingCart()") {
                presenter.viewDidTapShoppingCart(viewControllerInputMock)

                expect(routerMock.routeToShoppingCartCalled).to(beTrue())
            }
        }

        describe("categoryForItemManager(_:didSelectCellAt:)") {
            it("should call viewController.scrollCategorizedItems(to:)") {
                presenter.categoryForItemManager(itemCategoryCollectionManagerMock, didSelectCellAt: IndexPath(row: 0, section: 0))

                expect(viewControllerInputMock.scrollCategorizedItemsToCalled).to(beTrue())
            }
        }

        describe("itemForCategory(_:didSelectCellAt:)") {
            it("should call viewController.scrollItemCategories(to:)") {
                presenter.itemForCategory(itemCategoryCollectionManagerMock, didSelectCellAt: IndexPath(row: 0, section: 0))

                expect(viewControllerInputMock.scrollItemCategoriesToCalled).to(beTrue())
            }
        }
    }
}
