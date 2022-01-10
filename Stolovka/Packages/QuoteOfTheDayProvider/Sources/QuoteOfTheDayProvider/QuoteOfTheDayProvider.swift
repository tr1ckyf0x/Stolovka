//
//  QuoteOfTheDayProvider.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

public protocol QuoteOfTheDayProvider: AnyObject {
    var quoteOfTheDay: String { get }
}

public final class DumbQuoteOfTheDayProvider: QuoteOfTheDayProvider {
    public var quoteOfTheDay: String { "Есть будешь, или как?" }
}
