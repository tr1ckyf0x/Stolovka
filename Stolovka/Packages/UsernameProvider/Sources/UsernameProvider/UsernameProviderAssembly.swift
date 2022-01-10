//
//  UsernameProviderAssembly.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import Swinject

public struct UsernameProviderAssembly: Assembly {

    public init() { }

    public func assemble(container: Container) {
        container.register(UsernameProvider.self) { _ -> UsernameProvider in
            DumbUsernameProvider()
        }
        .inObjectScope(.container)
    }
}
