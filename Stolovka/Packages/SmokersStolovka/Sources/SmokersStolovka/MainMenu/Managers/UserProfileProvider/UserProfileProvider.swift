//
//  UserProfileProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation

protocol UserProfileProvider {
    var userName: String { get }
    var birthday: String? { get }
    var email: String? { get }
    var addresses: [Address]? { get }
}

extension UserProfileProvider {
    var birthday: String? { return nil }
    var email: String? { return nil}
    var addresses: [Address]? { return nil }
}

struct Address {
    var city: String
    
    init(city: String) {
        self.city = city
    }
}

struct UserProfileDataProvider: UserProfileProvider {
    var userName: String { return "Аркадий"}
}

