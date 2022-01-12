//
//  CategorizedFoodItemsManager.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit

final class CategorizedFoodItemsManager: NSObject {
    var categorizedFoodItems = [CategorizedFoodItems]()
    
}

extension CategorizedFoodItemsManager: MainScreenCategorizedFoodItemsCollectionProtocol {
    
    func setupCategorizedItems(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }
}

extension CategorizedFoodItemsManager: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categorizedFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        return categorizedFoodItems[section].products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodCollectionViewCell.self)", for: indexPath) as? FoodCollectionViewCell {
            cell.configure(foodItem: categorizedFoodItems[indexPath.section].products[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
}
