//
//  AddHostPresenterSpec.swift
//  WakeOnLanTests
//
//  Created by Владислав Лисянский on 01.11.2020.
//  Copyright © 2020 Владислав Лисянский. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Stolovka

final class AddHostPresenterSpec: QuickSpec {

    override func spec() {
        var presenter: MainScreenPresenter!
        var collectionManagerMock: MainScreenProductCarouselCollectionManagerMock!
        var fetchGreetingUseCaseMock: FetchGreetingUseCaseMock!
        var fetchOldsRecommendedProductsUseCaseMock: FetchOldsRecommendedProductsUseCaseMock!
        var viewControllerMock: MainScreenViewControllerMock!

        beforeEach {
            presenter = MainScreenPresenter()

            collectionManagerMock = MainScreenProductCarouselCollectionManagerMock()
            fetchGreetingUseCaseMock = FetchGreetingUseCaseMock()
            fetchOldsRecommendedProductsUseCaseMock = FetchOldsRecommendedProductsUseCaseMock()
            viewControllerMock = MainScreenViewControllerMock()

            presenter.viewController = viewControllerMock
            presenter.oldsRecommendedCollectionManager = collectionManagerMock
            presenter.fetchGreetingUseCase = fetchGreetingUseCaseMock
            presenter.fetchOldsRecommendedProductsUseCase = fetchOldsRecommendedProductsUseCaseMock

        }

        describe("viewDidLoad") {
            it("should call setupViews()") {
                presenter.viewDidLoad(viewControllerMock)

                expect(viewControllerMock.didCallSetupViews).to(beTrue())
            }

            it("should call fetchGreetingUseCase.execute()") {
                presenter.viewDidLoad(viewControllerMock)

                expect(fetchGreetingUseCaseMock.didCallExecute).to(beTrue())
            }

            it("should call viewController.setGreeting(model:)") {
                presenter.viewDidLoad(viewControllerMock)

                expect(viewControllerMock.didCallSetGreeting).to(beTrue())
            }

            it("should call fetchOldsRecommendedProductsUseCase.executeAsync(completion:)") {
                presenter.viewDidLoad(viewControllerMock)

                expect(fetchOldsRecommendedProductsUseCaseMock.didCallExecuteAsync).to(beTrue())
            }

            it("should call oldsRecommendedCollectionManager.setProducts(_:)") {
                presenter.viewDidLoad(viewControllerMock)

                expect(collectionManagerMock.didCallSetProducts).to(beTrue())
            }

            it("should call viewController.reloadOldsRecommendedCollection()") {
                presenter.viewDidLoad(viewControllerMock)

                expect(viewControllerMock.didCallReloadOldsRecommendedCollection).to(beTrue())
            }
        }

    }
}
