//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit

final class ShoppingCartPresenter {
    var tableViewManager: ShoppingCartTableViewManager?
}

extension ShoppingCartPresenter: ShoppingCartControllerOutput {

    func viewDidLoad(_ view: ShoppingCartControllerInput) {
        view.reloadShoppingCartTableView()
    }

}
