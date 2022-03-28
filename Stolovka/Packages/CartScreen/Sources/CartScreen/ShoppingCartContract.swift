//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import Models

protocol ShoppingCartControllerInput: AnyObject {
    func reloadShoppingCartTableView()

}

protocol ShoppingCartControllerOutput: AnyObject {
    func viewDidLoad(_ view: ShoppingCartControllerInput)
}

protocol ShoppingCartTableManagerProtocol: AnyObject {
    func setFoodItems(_ foodItems: [FoodItem])
}
