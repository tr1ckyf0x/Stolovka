//
//  FetchOldsRecommendedProductsUseCaseMock.swift
//  StolovkaTests
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
@testable import Stolovka

final class FetchOldsRecommendedProductsUseCaseMock: AsyncUseCase<Void, [MainScreenProduct]> {

    private(set) var didCallExecuteAsync = false

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[MainScreenProduct], Error>) -> Void) {
        didCallExecuteAsync = true
        completion(.success([]))
    }
}
