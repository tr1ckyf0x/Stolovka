import Foundation
import SharedResources
import UIKit

protocol NavigationControllerProtocol {
    func setupMainScreenNavigation(for viewController: UIViewController)
}

class NavigationController: NavigationControllerProtocol {

    func setupMainScreenNavigation(for viewController: UIViewController) {
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(sfSymbol: SFSymbol.takeoutbagAndCupAndStraw), style: .plain, target: self, action: #selector (didTapShoppingCart))
        viewController.navigationItem.rightBarButtonItem?.tintColor = SharedResources.Asset.Colors.shoppingCart.color
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(sfSymbol: SFSymbol.threeLinesHorizontal), style: . plain, target: self, action: #selector (didTapMenuButton))
        viewController.navigationItem.leftBarButtonItem?.tintColor = SharedResources.Asset.Colors.menu.color
    }

    @objc private func didTapShoppingCart() {
        print("Tapped Shopping Cart")

    }

    @objc private func didTapMenuButton() {
        print("Tapped Menu Button")
    }
}
