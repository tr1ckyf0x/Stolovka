//
//  MainScreenViewController.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit

final class MainScreenViewController: UIViewController {

    private let mainScreenView = MainScreenView()

    var presenter: MainScreenViewControllerOutput?

    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

}

// MARK: - MainScreenViewControllerInput
extension MainScreenViewController: MainScreenViewControllerInput {
    func setupViews() {
    }

    func setGreeting(model: MainScreenGreetingModel) {
        mainScreenView.greetingView.greetingText = model.greeting
        mainScreenView.greetingView.quoteOfTheDayText = model.quoteOfTheDay
    }
}
