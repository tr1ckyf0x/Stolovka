//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit

protocol ShoppingCartControllerInput: AnyObject {
    func reloadShoppingCartTableView()

}

protocol ShoppingCartControllerOutput: AnyObject {
    func viewDidLoad(_ view: ShoppingCartControllerInput)
}

protocol ShoppingCartTableManagerProtocol: AnyObject {
}
