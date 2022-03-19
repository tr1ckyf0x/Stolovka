//
//  UserProfileProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

public protocol UserProfileProvider {
    var userName: String { get }
    var birthday: String? { get }
    var email: String? { get }
    var addresses: [Address]? { get }
}

extension UserProfileProvider {
    public var birthday: String? { return nil }
    public var email: String? { return nil}
    public var addresses: [Address]? { return nil }
}

public struct Address {
    public var city: String
    
    public init(city: String) {
        self.city = city
    }
}

public final class UserProfileDataProvider: UserProfileProvider {
    public var userName: String { return "Аркадий" }

    public init() {
    }
}

