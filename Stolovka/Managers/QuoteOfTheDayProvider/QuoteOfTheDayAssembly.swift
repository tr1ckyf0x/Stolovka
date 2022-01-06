//
//  QuoteOfTheDayAssembly.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import Swinject

struct QuoteOfTheDayAssembly: Assembly {

    init() { }

    func assemble(container: Container) {
        container.register(QuoteOfTheDayProvider.self) { _ -> QuoteOfTheDayProvider in
            DumbQuoteOfTheDayProvider()
        }
    }
}
