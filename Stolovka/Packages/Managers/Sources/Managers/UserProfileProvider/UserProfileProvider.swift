//
//  UserProfileProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import Models

// sourcery: AutoMockable
public protocol UserProfileProvider {
    var userName: String { get }
    var birthday: String? { get }
    var email: String? { get }
    var addresses: [Address] { get }
}

extension UserProfileProvider {
    public var birthday: String? { nil }
    public var email: String? { nil }
    public var addresses: [Address] { [] }
}

public final class UserProfileDataProvider: UserProfileProvider {
    public var userName: String { "Аркадий" }

    public init() {
    }
}
