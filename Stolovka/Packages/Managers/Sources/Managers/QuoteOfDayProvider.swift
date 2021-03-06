//
//  QuoteOfDayProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

// sourcery: AutoMockable
public protocol QouteOfDayProvider {
    var qouteOfDay: String { get }
}

public final class QouteOfDayDataProvider: QouteOfDayProvider {
    public var qouteOfDay: String { SharedResources.L10n.willYouEat }

    public init() { }
}
