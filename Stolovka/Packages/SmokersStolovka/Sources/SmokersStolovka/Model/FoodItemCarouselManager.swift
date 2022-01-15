//
//  CategorizedFoodItemsManager.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit

protocol ItemForCateogryDelegate: AnyObject {
    func itemForCategory(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath)
}

protocol FoodItemCarouselDelegate: AnyObject {
    func categorizedFoodItemsManagerNeedsDelegateForFoodCell(_ categorizedFoodItemsManager: MainScreenCategorizedFoodItemsCollectionProtocol) -> FoodCollectionViewCellDelegate?
}

final class FoodItemCarouselManager: NSObject, MainScreenItemCategoryProtocol {
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }
    
    private var categorizedFoodItems = [CategorizedFoodItems]()
    
    private var lastIndexPath = IndexPath(row: 0, section: 0)

    weak var itemForCategoryDelegate: ItemForCateogryDelegate?
    weak var delegate: FoodItemCarouselDelegate?
}

extension FoodItemCarouselManager: MainScreenCategorizedFoodItemsCollectionProtocol {
    
    func setupCategorizedItems(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }
}

extension FoodItemCarouselManager: MainScreenRecommendationsCollectionProtocol {
    func setupRecommendations(_ foodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = foodItems
    }
    
    
}

extension FoodItemCarouselManager: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categorizedFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        return categorizedFoodItems[section].products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodCollectionViewCell.self)", for: indexPath) as? FoodCollectionViewCell {
            cell.configure(foodItem: categorizedFoodItems[indexPath.section].products[indexPath.item])
            let cellDelegate = delegate?.categorizedFoodItemsManagerNeedsDelegateForFoodCell(self)
            cell.foodItem = categorizedFoodItems[indexPath.section].products[indexPath.item]
            cell.delegate = cellDelegate
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FoodItemCarouselManager: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - (Constants.numberOfItemsOnScreen * Constants.minimalItemSpacing)) / Constants.numberOfItemsOnScreen
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: lastIndexPath, animated: true)
            lastIndexPath = indexPath
        itemForCategoryDelegate?.itemForCategory(self, didSelectCellAt: indexPath)
        
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            print("Selected Item FOOD ")
    }
}

// MARK: - Constants
extension FoodItemCarouselManager {
    private enum Constants {
        static let minimalItemSpacing: CGFloat = 20
        static let numberOfItemsOnScreen: CGFloat = 2.3
        static let spacesBetweenItems: CGFloat = numberOfItemsOnScreen.rounded() - 1
    }
}
