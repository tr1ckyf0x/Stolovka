//
//  FoodItem.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import SharedResources

struct FoodItem {
    var name: String
    var price: Double
    var description: String
    var pictureUrl: PictureFormat
    var isLikedByUser: Bool
    var itemID: String
}
