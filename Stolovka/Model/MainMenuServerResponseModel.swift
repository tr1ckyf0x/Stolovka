//
//  MainMenuServerResponseModel.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 03.01.2022.
//

import Foundation

class MainMenuResponseModel {
    var userName: String?
    var qouteOfTheDay: String?
    var doesContainSearchBar: Bool?
    
    init? (stringNameFunction: String, stringQouteFunction: String, doesContainSearchBar: Bool) {
        self.userName = stringNameFunction
        self.qouteOfTheDay = stringQouteFunction
        self.doesContainSearchBar = doesContainSearchBar
    }
}
