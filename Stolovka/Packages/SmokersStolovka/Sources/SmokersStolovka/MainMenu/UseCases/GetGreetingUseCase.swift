//
//   GetGreetingUseCase.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
import SharedResources
import Models
import Managers

final class GetGreetingUseCase: UseCase<Void, ChumBucketGreetingModel> {

    private let usernameProvider: UserProfileProvider
    private let quoteOfDayProvider: QouteOfDayProvider

    init(usernameProvider: UserProfileProvider, quoteOfDayProvider: QouteOfDayProvider) {
        self.usernameProvider = usernameProvider
        self.quoteOfDayProvider = quoteOfDayProvider
    }

    override func execute(_ requestArgument: Void) -> ChumBucketGreetingModel {
        let name = usernameProvider.userName
        let greetingText = SharedResources.L10n.standardGreeting(name)
        let quote = quoteOfDayProvider.qouteOfDay
        return ChumBucketGreetingModel(greeting: greetingText, quoteOfTheDay: quote)
    }
}
