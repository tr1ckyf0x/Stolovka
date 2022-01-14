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
    var recommendationsCollectionManager: MainScreenCategorizedFoodItemsCollectionProtocol?
    var itemCategoryCollectionManager: MainScreenItemCategoryProtocol?
    
    var categorizedFoodItemsCollectionManager: MainScreenCategorizedFoodItemsCollectionProtocol?
    
    var recommendationsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]>?
    var fetchCategorizedItemsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]>?
}

// MARK: - MainScreenControllerOutput
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

// MARK: - CategoryForItemManagerDelegate
extension StolovkaMainScreenPresenter: CategoryForItemManagerDelegate {
    func categoryForItemManager(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath) {
        viewController?.scrollCategorizedItems(to: indexPath)
    }
}

//MARK: - Private Functions
extension StolovkaMainScreenPresenter {
    
    private func setGreeting() {
        guard let greetingModel = fetchGreetingUseCase?.execute() else { return }
        viewController?.setGreeting(model: greetingModel)
    }
    
    private func fetchRecommendations() {
        recommendationsUseCase?.executeAsync { [weak self] (result: Result<[CategorizedFoodItems], Error>) in
            switch result {
            case let .success(products):
                self?.recommendationsCollectionManager?.setupCategorizedItems(products)
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
