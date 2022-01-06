//
//  UsernameProvider.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

protocol UsernameProvider: AnyObject {
    var username: String { get }
}

final class DumbUsernameProvider: UsernameProvider {
    var username: String { L10n.MainScreen.dumbName }
}
