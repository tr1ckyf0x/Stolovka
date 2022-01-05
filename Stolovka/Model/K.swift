//
//  K.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 31.12.2021.
//

import Foundation
import UIKit

public let constants = K()

public struct K {
    let navigationItemShoppingCartColor = UIColor(red: 1.0, green: 0.207, blue: 0.72, alpha: 1)
    let navigationItemMenuColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    let viewControllerBackgroundColor = UIColor.lightGray
    let viewControllerTableViewBackgroundColor = UIColor.white
    
    let greetingCellMainColor = UIColor.darkGray
    let standardGreeting = "Привет,"
    let guest = "Гость"
    
    let searchBarMessage = "Поиск по столовке..."
    let searchBarBackgroundColor: UIColor = .lightGray
    let searchBarImageString = "slider.horizontal.3"
    let searchBarTextColor: UIColor = .darkGray
    
    let tableViewAllowsHeaderNames = false
}
