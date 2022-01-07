//
//  FetchGreetingUseCaseMock.swift
//  StolovkaTests
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UseCase
@testable import Stolovka

final class FetchGreetingUseCaseMock: UseCase<Void, MainScreenGreetingModel> {

    private(set) var didCallExecute = false

    override func execute(_ requestArgument: Void) -> MainScreenGreetingModel {
        didCallExecute = true
        return MainScreenGreetingModel(greeting: "", quoteOfTheDay: "")
    }
}
