//
//  ChumBucketGreetingModel.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 12.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

public struct ChumBucketGreetingModel {
    public let greeting: String
    public let quoteOfTheDay: String

    public init(
        greeting: String,
        quoteOfTheDay: String
    ) {
        self.greeting = greeting
        self.quoteOfTheDay = quoteOfTheDay
    }
}
