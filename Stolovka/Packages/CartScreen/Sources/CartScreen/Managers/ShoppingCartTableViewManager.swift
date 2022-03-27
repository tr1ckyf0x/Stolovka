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
    let foodItem = FoodItem(name: "TEST", price: 12, description: "С мясом. Пахнет как кирпич.", pictureUrl: .local(SharedResources.Asset.Assets.Products.bun), isLikedByUser: true, itemID: "333")
}

extension ShoppingCartTableViewManager: ShoppingCartTableManagerProtocol {
}

extension ShoppingCartTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingCartTableViewCell.self)", for: indexPath) as? ShoppingCartTableViewCell {
            cell.configure(foodItem: foodItem)
            return cell
        } else {
            fatalError("Could not deque cell")
        }
    }
}
