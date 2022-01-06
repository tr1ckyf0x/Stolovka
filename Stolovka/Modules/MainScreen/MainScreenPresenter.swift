//
//  MainScreenPresenter.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase

final class MainScreenPresenter {

    weak var viewController: MainScreenViewControllerInput?

    var oldsRecommendedCollectionManager: MainScreenProductCarouselCollectionManagerProtocol?

    var fetchGreetingUseCase: UseCase<Void, MainScreenGreetingModel>?
    var fetchOldsRecommendedProductsUseCase: AsyncUseCase<Void, [MainScreenProduct]>?
}

// MARK: - MainScreenViewControllerOutput
extension MainScreenPresenter: MainScreenViewControllerOutput {
    func viewDidLoad(_ view: MainScreenViewControllerInput) {
        view.setupViews()
        updateGreeting()
        fetchOldsRecommendedProducts()
    }
}

// MARK: - Private methods
extension MainScreenPresenter {
    private func updateGreeting() {
        guard let greetingModel = fetchGreetingUseCase?.execute() else { return }
        viewController?.setGreeting(model: greetingModel)
    }

    private func fetchOldsRecommendedProducts() {
        fetchOldsRecommendedProductsUseCase?.executeAsync { [weak self] (result: Result<[MainScreenProduct], Error>) in
            switch result {
            case let .success(products):
                self?.oldsRecommendedCollectionManager?.setProducts(products)
                self?.viewController?.reloadOldsRecommendedCollection()

            case let .failure(error):
                print(error)
            }
        }
    }
}
