//
//  QuoteOfDayProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

protocol QouteOfDayProvider {
    var qouteOfDay: String { get }
}

class QouteOfDayDataProvider: QouteOfDayProvider {
    var qouteOfDay: String { return SharedResources.L10n.willYouEat}
}
