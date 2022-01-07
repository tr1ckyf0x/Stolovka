//
//  MainScreenProductCarouselCollectionManagerMock.swift
//  StolovkaTests
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
@testable import Stolovka

final class MainScreenProductCarouselCollectionManagerMock {
    private(set) var didCallSetProducts = false
}

extension MainScreenProductCarouselCollectionManagerMock: MainScreenProductCarouselCollectionManagerProtocol {
    func setProducts(_ products: [MainScreenProduct]) {
        didCallSetProducts = true
    }
}
