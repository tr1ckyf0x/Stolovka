//
//  File.swift
//  
//
//  Created by Nikita Shvad on 14.01.2022.
//

import Foundation
import UseCase

class SaveToShoppingCartUseCase: UseCase<Void, Void> {
    override func execute(_ requestArgument: Void) -> Void {
        print("added item to shopping cart")
    }
}
