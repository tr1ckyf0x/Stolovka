//
//  StolovkaMainScreenPresenter.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
import SharedModels

class StolovkaMainScreenPresenter {
    
    weak var viewController: MainScreenControllerInput?
    var fetchGreetingUseCase: UseCase<Void, ChumBucketGreetingModel>?
    var recommendationsCollectionManager: MainScreenRecommendationsCollectionProtocol?
    var itemCategoryCollectionManager: MainScreenItemCategoryProtocol?
    var itemCategoryCollectionDelegate: ItemCategoryCollectionViewDelegate?
    
    var categorizedFoodItemsCollectionManager: MainScreenCategorizedFoodItemsCollectionProtocol?
    
    var recommendationsUseCase: AsyncUseCase<Void, [FoodItem]>?
    var fetchCategorizedItemsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]>?
}

extension StolovkaMainScreenPresenter: MainScreenControllerOutput {
    
    func viewDidLoad(mainScreen: MainScreenControllerInput) {
        setGreeting()
        fetchRecommendations()
        fetchCategorizedItems()
        mainScreen.loadViews()
        mainScreen.reloadRecommendationsTitles()
        mainScreen.reloadRecommendationsCollection()
        mainScreen.reloadCategorizedItemsCollection()
    }
}

//MARK: - Private Functions
extension StolovkaMainScreenPresenter {
    
    private func setGreeting() {
        guard let greetingModel = fetchGreetingUseCase?.execute() else { return }
        viewController?.setGreeting(model: greetingModel)
    }
    
    private func fetchRecommendations() {
        recommendationsUseCase?.executeAsync { [weak self] (result: Result<[FoodItem], Error>) in
            switch result {
            case let .success(products):
                self?.recommendationsCollectionManager?.setupRecommendations(products)
                self?.viewController?.reloadRecommendationsCollection()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func fetchCategorizedItems() {
        fetchCategorizedItemsUseCase?.executeAsync { [weak self] (result: Result<[CategorizedFoodItems], Error>) in
            switch result {
            case let .success(products):
                self?.categorizedFoodItemsCollectionManager?.setupCategorizedItems(products)
                self?.itemCategoryCollectionManager?.setupItemCategories(products)
                self?.viewController?.reloadRecommendationsCollection()
                self?.viewController?.reloadRecommendationsTitles()
            case let .failure(error):
                print(error)
            }
        }
    }
}
