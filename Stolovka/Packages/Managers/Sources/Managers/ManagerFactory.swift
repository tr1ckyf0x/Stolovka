//
//  File.swift
//  
//
//  Created by Nikita Shvad on 28.03.2022.
//

import Foundation

public final class ManagerFactory {

    public static let shared = ManagerFactory()

    public private(set) lazy var shoppingCartManager: ShoppingCartManagerProtocol = {
        ShoppingCartManager()
    }()
}
