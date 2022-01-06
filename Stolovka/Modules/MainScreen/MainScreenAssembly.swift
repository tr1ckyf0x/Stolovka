//
//  MainScreenAssembly.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import Swinject

struct MainScreenAssembly: Assembly {

    init() { }

    func assemble(container: Container) {
        container.register(MainScreenViewController.self) { _ -> MainScreenViewController in
            let viewController = MainScreenViewController()
            viewController.tabBarItem.title = L10n.MainScreen.tabBarTitle
            viewController.tabBarItem.image = UIImage(sfSymbol: SFSymbol.house)
            return viewController
        }
        .initCompleted { (resolver: Resolver, viewController: MainScreenViewController) in
            let presenter = resolver.resolve(MainScreenViewControllerOutput.self)
            let oldsRecommendedCollectionViewDataSource = resolver.resolve(UICollectionViewDataSource.self, name: Constants.oldsRecommendedCollectionManagerKey)
            viewController.presenter = presenter
            viewController.setOldsRecommendedCollectionDataSource(oldsRecommendedCollectionViewDataSource)
        }
        .implements(UIViewController.self, name: Constants.viewControllerKey)
        .implements(MainScreenViewControllerInput.self)

        container.register(MainScreenPresenter.self) { _ -> MainScreenPresenter in
            MainScreenPresenter()
        }
        .initCompleted { (resolver: Resolver, presenter: MainScreenPresenter) in
            let viewController = resolver.resolve(MainScreenViewControllerInput.self)
            let fetchGreetingUseCase = resolver.resolve(FetchGreetingUseCase.self)
            let fetchOldsRecommendedProductsUseCase = resolver.resolve(FetchOldsRecommendedProductsUseCase.self)
            let oldsRecommendedCollectionManager = resolver.resolve(MainScreenProductCarouselCollectionManagerProtocol.self, name: Constants.oldsRecommendedCollectionManagerKey)
            presenter.viewController = viewController
            presenter.fetchGreetingUseCase = fetchGreetingUseCase
            presenter.fetchOldsRecommendedProductsUseCase = fetchOldsRecommendedProductsUseCase
            presenter.oldsRecommendedCollectionManager = oldsRecommendedCollectionManager
        }
        .implements(MainScreenViewControllerOutput.self)

        container.register(FetchGreetingUseCase.self) { (resolver: Resolver) -> FetchGreetingUseCase in
            let usernameProvider = resolver.resolve(UsernameProvider.self)!
            let quoteOfTheDayProvider = resolver.resolve(QuoteOfTheDayProvider.self)!
            return FetchGreetingUseCase(
                usernameProvider: usernameProvider,
                quouteOfTheDayProvider: quoteOfTheDayProvider
            )
        }

        container.register(FetchOldsRecommendedProductsUseCase.self) { (resolver: Resolver) -> FetchOldsRecommendedProductsUseCase in
            let oldsRecommendedProductsProvider = resolver.resolve(OldsRecommendedProductsProvider.self)!
            return FetchOldsRecommendedProductsUseCase(oldsRecommendedProductsProvider: oldsRecommendedProductsProvider)
        }

        container.register(MainScreenProductCarouselCollectionManager.self, name: Constants.oldsRecommendedCollectionManagerKey) { (
            resolver: Resolver
        ) -> MainScreenProductCarouselCollectionManager in
            MainScreenProductCarouselCollectionManager()
        }
        .implements(MainScreenProductCarouselCollectionManagerProtocol.self, name: Constants.oldsRecommendedCollectionManagerKey)
        .implements(UICollectionViewDataSource.self, name: Constants.oldsRecommendedCollectionManagerKey)
    }
}

extension MainScreenAssembly {
    enum Constants {
        static let viewControllerKey = "\(MainScreenViewController.self)"

        fileprivate static let oldsRecommendedCollectionManagerKey = "oldsRecommendedCollectionManager"
    }
}
