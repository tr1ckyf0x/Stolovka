//
//  StolovkaMainScreenBuilder.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import Managers

public enum StolovkaMainScreenBuilder {
    public static func buildStolovkaMainScreen() -> UIViewController {
        let viewController = MainScreenViewController()
        let presenter = StolovkaMainScreenPresenter()
        let router = MainScreenRouter()

        let usernameProvider = UserProfileDataProvider()
        let quoteOfDayProvider = QouteOfDayDataProvider()
        let recommendationsProvider = RecommendationsProvider()
        let recommendationsCollectionViewManager = FoodItemCarouselManager()

        let categorizedFoodProvider = CategorizedItemsProvider()
        let categorizedFoodItemsManager = FoodItemCarouselManager()
        let categoryForItemManager = CategoryForItemManager()
        let shoppingCart = ShoppingCartManager()
        let getGreetingUseCase = GetGreetingUseCase(
            usernameProvider: usernameProvider,
            quoteOfDayProvider: quoteOfDayProvider
        )

        let fetchRecommendationsUseCase = NsFetchRecommendationsUseCase(recommendationsProvider: recommendationsProvider)
        let fetchCategorizedItemsUseCase = NSFetchCategorizedItemsUseCase(categorizedItemsProvider: categorizedFoodProvider)
        let addToShoppingCartUseCase = AddToCartUseCase(shoppingCart: shoppingCart)

        presenter.fetchGreetingUseCase = getGreetingUseCase
        presenter.recommendationsUseCase = fetchRecommendationsUseCase
        presenter.fetchCategorizedItemsUseCase = fetchCategorizedItemsUseCase
        presenter.addToCartUseCase = addToShoppingCartUseCase

        presenter.router = router
        router.viewController = viewController

        presenter.recommendationsCollectionManager = recommendationsCollectionViewManager
        viewController.setRecommendationsDataSource(dataSource: recommendationsCollectionViewManager)

        categoryForItemManager.delegate = presenter
        categorizedFoodItemsManager.itemForCategoryDelegate = presenter

        categorizedFoodItemsManager.delegate = viewController
        recommendationsCollectionViewManager.delegate = viewController

        presenter.itemCategoryCollectionManager = categoryForItemManager
        viewController.setItemCategoryCollectionViewDataSource(dataSource: categoryForItemManager)
        viewController.setItemCategoryDelegate(delegate: categoryForItemManager)
        viewController.setCategorizedFoodItemsDelegate(delegate: categorizedFoodItemsManager)

        presenter.categorizedFoodItemsCollectionManager = categorizedFoodItemsManager
        viewController.setCategorizedItemsDataSource(dataSource: categorizedFoodItemsManager)

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
