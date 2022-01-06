//
//  QuoteOfTheDayProvider.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

protocol QuoteOfTheDayProvider: AnyObject {
    var quoteOfTheDay: String { get }
}

final class DumbQuoteOfTheDayProvider: QuoteOfTheDayProvider {
    var quoteOfTheDay: String { L10n.MainScreen.willYouEat }
}
