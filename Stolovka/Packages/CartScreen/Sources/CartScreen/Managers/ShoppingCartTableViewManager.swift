//
//  ShoppingCartTableViewManager.swift
//  
//
//  Created by Nikita Shvad on 21.03.2022.
//
import UIKit
import Models
import SharedResources

// remove placeholder -> develop use case from shopping cart manager -> presenter

final class ShoppingCartTableViewManager: NSObject {
    let foodItem = FoodItem(name: "TEST", price: 12, description: "С мясом. Пахнет как кирпич.", pictureUrl: .local(SharedResources.Asset.Assets.Products.bun), isLikedByUser: true, itemID: "333")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingCartTableViewCell.self)", for: indexPath) as? ShoppingCartTableViewCell else {
            fatalError("Could not deque cell")
        }
        let foodItem = foodItems[indexPath.row]
        cell.configure(foodItem: foodItem)
        return cell
    }
}
