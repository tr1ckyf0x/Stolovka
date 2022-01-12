//
//  RecommendationsCollectionViewManager.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit

final class RecommendationsCollectionViewManager: NSObject {
    private var foodItems = [FoodItem]()
}

extension RecommendationsCollectionViewManager: MainScreenRecommendationsCollectionProtocol {
    func setupRecommendations(_ foodItems: [FoodItem]) {
        self.foodItems = foodItems
    }
}

extension RecommendationsCollectionViewManager: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodCollectionViewCell.self)", for: indexPath) as? FoodCollectionViewCell {
            cell.configure(foodItem: foodItems[indexPath.item])
            return cell
            
        }
        return UICollectionViewCell()
    }
}
