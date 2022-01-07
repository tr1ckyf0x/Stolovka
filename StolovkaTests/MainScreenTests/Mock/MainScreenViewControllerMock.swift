//
//  MainScreenViewControllerMock.swift
//  StolovkaTests
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
@testable import Stolovka

final class MainScreenViewControllerMock {
    private(set) var didCallSetupViews = false
    private(set) var didCallSetGreeting = false
    private(set) var didCallReloadOldsRecommendedCollection = false
}

extension MainScreenViewControllerMock: MainScreenViewControllerInput {
    func setupViews() {
        didCallSetupViews = true
    }

    func setGreeting(model: MainScreenGreetingModel) {
        didCallSetGreeting = true
    }

    func reloadOldsRecommendedCollection() {
        didCallReloadOldsRecommendedCollection = true
    }
}
