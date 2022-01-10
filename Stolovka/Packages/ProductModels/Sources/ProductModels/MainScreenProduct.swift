//
//  MainScreenProduct.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedModels

public struct MainScreenProduct {
    public let name: String
    public let price: Double
    public let image: ImageSource

    public init(
        name: String,
        price: Double,
        image: ImageSource
    ) {
        self.name = name
        self.price = price
        self.image = image
    }
}
