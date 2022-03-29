//
//  StolovkaMainScreenContract.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import SharedModels
import UIKit
import Models

protocol MainScreenControllerInput: AnyObject {
    func setGreeting(model: ChumBucketGreetingModel)
    func loadViews()
    func reloadRecommendationsTitles()
    func reloadRecommendationsCollection()
    func reloadCategorizedItemsCollection()
    func scrollCategorizedItems(to indexPath: IndexPath)
    func scrollItemCategories(to indexPath: IndexPath)
}

protocol MainScreenControllerOutput: AnyObject {
    func viewDidLoad(_ view: MainScreenControllerInput)
    func view(_ view: MainScreenControllerInput, didTapAddButtonFor foodItem: FoodItem)
    func view(_ view: MainScreenControllerInput, didTapLikeButtonFor foodItem: FoodItem)
    func viewDidTapShoppingCart(_ view: MainScreenControllerInput)
}

protocol MainScreenFoodItemsCollectionManagerProtocol: AnyObject {
    func setFoodItems(_ foodItems: [CategorizedFoodItems])
}

protocol MainScreenItemCategoryProtocol: AnyObject {
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems])
}

protocol MainScreenRouterProtocol: AnyObject {
    func routeToShoppingCart()
}
