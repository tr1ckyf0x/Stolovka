//
//  FetchGreetingUseCase.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
import UsernameProvider
import QuoteOfTheDayProvider
import SharedResources

final class FetchGreetingUseCase: UseCase<Void, MainScreenGreetingModel> {

    private let usernameProvider: UsernameProvider
    private let quouteOfTheDayProvider: QuoteOfTheDayProvider

    init(
        usernameProvider: UsernameProvider,
        quouteOfTheDayProvider: QuoteOfTheDayProvider
    ) {
        self.usernameProvider = usernameProvider
        self.quouteOfTheDayProvider = quouteOfTheDayProvider
    }

    override func execute(_ requestArgument: Argument) -> Res {
        let name = usernameProvider.username
        let greetingText = SharedResources.L10n.standardGreeting(name)
        let quoteOfTheDay = quouteOfTheDayProvider.quoteOfTheDay
        return MainScreenGreetingModel(
            greeting: greetingText,
            quoteOfTheDay: quoteOfTheDay
        )
    }
}
