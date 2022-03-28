//
//  File.swift
//  
//
//  Created by Nikita Shvad on 21.03.2022.
//

import Foundation
import UIKit
import Models
import SharedResources

// remove placeholder -> develop use case from shopping cart manager -> presenter

final class ShoppingCartTableViewManager: NSObject {
    var foodItems: [FoodItem] = []
}

extension ShoppingCartTableViewManager: ShoppingCartTableManagerProtocol {
    func setFoodItems(_ foodItems: [FoodItem]) {
        self.foodItems = foodItems
    }
}

extension ShoppingCartTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingCartTableViewCell.self)", for: indexPath) as? ShoppingCartTableViewCell {
            let foodItem = foodItems[indexPath.row]
            cell.configure(foodItem: foodItem)
            return cell
        } else {
            fatalError("Could not deque cell")
        }
    }
}
