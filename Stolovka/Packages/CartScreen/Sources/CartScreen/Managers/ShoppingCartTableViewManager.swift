//
//  ShoppingCartTableViewManager.swift
//  
//
//  Created by Nikita Shvad on 21.03.2022.
//
import UIKit
import Models
import SharedResources

protocol ShoppingCartTableViewManagerDelegate: AnyObject {
    func shoppingCartManagerNeedsDelegateForFoodCell(_ shoppingTableCartManager: ShoppingCartTableManagerProtocol) -> ShoppingCartViewCellDelegate?
}

final class ShoppingCartTableViewManager: NSObject {
    private(set) var shoppingCartFoodItems: [CountableContainer<FoodItem>] = []
    weak var delegate: ShoppingCartTableViewManagerDelegate?
    weak var tableViewDelegate: ShoppingCartTableViewDelegate?
}

// MARK: - ShoppingCartTableManagerProtocol
extension ShoppingCartTableViewManager: ShoppingCartTableManagerProtocol {
    func setShoppingCartFoodItems(_ shoppingCartFoodItems: [CountableContainer<FoodItem>]) {
        self.shoppingCartFoodItems = shoppingCartFoodItems
    }
}

// MARK: - UITableViewDataSource
extension ShoppingCartTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingCartFoodItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingCartTableViewCell.self)", for: indexPath) as? ShoppingCartTableViewCell else {
            fatalError("Could not deque cell")
        }
        let shoppingCartFoodItem = shoppingCartFoodItems[indexPath.row]
        cell.configure(shoppingCartFoodItem: shoppingCartFoodItem)
        let cellDelegate = delegate?.shoppingCartManagerNeedsDelegateForFoodCell(self)
        cell.delegate = cellDelegate
        return cell
    }
}

final class ShoppingCartTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ShoppingCartPurchaseBlockView.self)")
        print("View")
        return view
    }
}
