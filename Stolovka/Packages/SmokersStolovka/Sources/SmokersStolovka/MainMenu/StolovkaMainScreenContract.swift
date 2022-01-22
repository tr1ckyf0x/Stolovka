//
//  StolovkaMainScreenContract.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import SharedModels
import UIKit

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
    func viewDidLoad(view: MainScreenControllerInput)
}

protocol MainScreenRecommendationsCollectionProtocol: AnyObject {
    func setupRecommendations(_ foodItems: [CategorizedFoodItems])
}

protocol MainScreenCategorizedFoodItemsCollectionProtocol: AnyObject {
    func setupCategorizedItems (_ categorizedFoodItems: [CategorizedFoodItems])
}

protocol MainScreenItemCategoryProtocol: AnyObject {
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems])
}
