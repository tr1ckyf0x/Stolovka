//
//  StolovkaMainScreenBuilder.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit

public enum StolovkaMainScreenBuilder {
    public static func buildStolovkaMainScreen() -> UIViewController {
        let viewController = ViewController()
        let presenter = StolovkaMainScreenPresenter()

        let usernameProvider = UserProfileDataProvider()
        let quoteOfDayProvider = QouteOfDayDataProvider()
        let recommendationsProvider = RecommendationsProvider()
        let recommendationsCollectionViewManager = RecommendationsCollectionViewManager()
        
        let categorizedFoodProvider = CategorizedItemsProvider()
        let categorizedFoodItemsManager = CategorizedFoodItemsManager()
        let categoryForItemManager = CategoryForItemManager()

        let getGreetingUseCase = GetGreetingUseCase(
            usernameProvider: usernameProvider,
            quoteOfDayProvider: quoteOfDayProvider
        )
        
        let fetchRecommendationsUseCase = NsFetchRecommendationsUseCase(recommendationsProvider: recommendationsProvider)
        let fetchCategorizedItemsUseCase = NSFetchCategorizedItemsUseCase(categorizedItemsProvider: categorizedFoodProvider)
        
        presenter.fetchGreetingUseCase = getGreetingUseCase
        presenter.recommendationsUseCase = fetchRecommendationsUseCase
        presenter.fetchCategorizedItemsUseCase = fetchCategorizedItemsUseCase
        
        presenter.recommendationsCollectionManager = recommendationsCollectionViewManager
        viewController.setRecommendationsDataSource(dataSource: recommendationsCollectionViewManager)
        
        presenter.itemCategoryCollectionManager = categoryForItemManager
        viewController.setItemCategoryCollectionViewDataSource(dataSource: categoryForItemManager)
        
        presenter.categorizedFoodItemsCollectionManager = categorizedFoodItemsManager
        viewController.setCategorizedItemsDataSource(dataSource: categorizedFoodItemsManager)
        
    

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
