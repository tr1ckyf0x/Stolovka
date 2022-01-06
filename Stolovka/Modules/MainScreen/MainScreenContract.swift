//
//  MainScreenContract.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

protocol MainScreenViewControllerInput: AnyObject {
    func setupViews()
    func setGreeting(model: MainScreenGreetingModel)
    func reloadOldsRecommendedCollection()
}

protocol MainScreenViewControllerOutput: AnyObject {
    func viewDidLoad(_ view: MainScreenViewControllerInput)
}

protocol MainScreenProductCarouselCollectionManagerProtocol: AnyObject {
    func setProducts(_ products: [MainScreenProduct])
}
