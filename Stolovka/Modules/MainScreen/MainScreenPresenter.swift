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

    var fetchGreetingUseCase: UseCase<Void, MainScreenGreetingModel>?

}

// MARK: - MainScreenViewControllerOutput
extension MainScreenPresenter: MainScreenViewControllerOutput {
    func viewDidLoad(_ view: MainScreenViewControllerInput) {
        view.setupViews()
        updateGreeting()
    }
}

// MARK: - Private methods
extension MainScreenPresenter {
    private func updateGreeting() {
        guard let greetingModel = fetchGreetingUseCase?.execute() else { return }
        viewController?.setGreeting(model: greetingModel)
    }
}
