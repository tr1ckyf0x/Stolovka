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
import Models

class StolovkaMainScreenPresenter {

    weak var viewController: MainScreenControllerInput?
    var router: MainScreenRouterProtocol?

    var fetchGreetingUseCase: UseCase<Void, ChumBucketGreetingModel>?
    var recommendationsCollectionManager: MainScreenFoodItemsCollectionManagerProtocol?
    var itemCategoryCollectionManager: MainScreenItemCategoryProtocol?
    var categorizedFoodItemsCollectionManager: MainScreenFoodItemsCollectionManagerProtocol?

    var recommendationsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]>?
    var addToCartUseCase: AsyncUseCase<FoodItem, Void>?
    var fetchCategorizedItemsUseCase: AsyncUseCase<Void, [CategorizedFoodItems]>?
}

// MARK: - MainScreenControllerOutput
extension StolovkaMainScreenPresenter: MainScreenControllerOutput {
    func viewDidLoad(_ view: MainScreenControllerInput) {
        setGreeting()
        fetchRecommendations()
        fetchCategorizedItems()
        view.loadViews()
        view.reloadRecommendationsTitles()
        view.reloadRecommendationsCollection()
        view.reloadCategorizedItemsCollection()
    }

    func view(_ view: MainScreenControllerInput, didTapAddButtonFor foodItem: FoodItem) {
        addToCartUseCase?.executeAsync(foodItem) { (result: Result<Void, Error>) in
            switch result {
            case .success:
                print("Success")

            case .failure:
                print("Failure")
            }
        }
    }

    func view(_ view: MainScreenControllerInput, didTapLikeButtonFor foodItem: FoodItem) {
    }

    func viewDidTapShoppingCart(_ view: MainScreenControllerInput) {
        router?.routeToShoppingCart()
    }
}

// MARK: - CategoryForItemManagerDelegate
extension StolovkaMainScreenPresenter: CategoryForItemManagerDelegate {
    func categoryForItemManager(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath) {
        viewController?.scrollCategorizedItems(to: IndexPath(item: 0, section: indexPath.section))
    }
}
extension StolovkaMainScreenPresenter: ItemForCategoryDelegate {
    func itemForCategory(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath) {
        viewController?.scrollItemCategories(to: IndexPath(item: 0, section: indexPath.section))
    }
}
// MARK: - Private methods
extension StolovkaMainScreenPresenter {

    private func setGreeting() {
        guard let greetingModel = fetchGreetingUseCase?.execute() else { return }
        viewController?.setGreeting(model: greetingModel)
    }

    private func fetchRecommendations() {
        recommendationsUseCase?.executeAsync { [weak self] (result: Result<[CategorizedFoodItems], Error>) in
            switch result {
            case let .success(products):
                self?.recommendationsCollectionManager?.setFoodItems(products)
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
                self?.categorizedFoodItemsCollectionManager?.setFoodItems(products)
                self?.itemCategoryCollectionManager?.setupItemCategories(products)
                self?.viewController?.reloadRecommendationsCollection()
                self?.viewController?.reloadRecommendationsTitles()

            case let .failure(error):
                print(error)
            }
        }
    }

}
