//
//  CategorizedFoodItemsManager.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//
import UIKit
import Models

protocol SetUpModelProtocol: AnyObject {
    func modelWithDetailedDescription() -> [CategorizedFoodItems]
}

protocol ItemForCategoryDelegate: AnyObject {
    func itemForCategory(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath)
}

protocol FoodItemCarouselDelegate: AnyObject {
    func foodItemsManagerNeedsDelegateForFoodCell(_ foodItemsCollectionManager: MainScreenFoodItemsCollectionManagerProtocol) -> FoodCollectionViewCellDelegate?
}

final class FoodItemCarouselManager: NSObject, MainScreenItemCategoryProtocol {
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }

    private var categorizedFoodItems = [CategorizedFoodItems]()

    private var lastIndexPath = IndexPath(row: 0, section: 0)

    weak var itemForCategoryDelegate: ItemForCategoryDelegate?
    weak var delegate: FoodItemCarouselDelegate?
}

// MARK: - SetUpModelProtocol
extension FoodItemCarouselManager: SetUpModelProtocol {
    func modelWithDetailedDescription() -> [CategorizedFoodItems] {
        categorizedFoodItems
    }
}

// MARK: - MainScreenFoodItemsCollectionManagerProtocol
extension FoodItemCarouselManager: MainScreenFoodItemsCollectionManagerProtocol {
    func setFoodItems(_ foodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = foodItems
    }
}

// MARK: - UICollectionViewDataSource
extension FoodItemCarouselManager: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categorizedFoodItems.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categorizedFoodItems[section].products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(FoodCollectionViewCell.self)",
            for: indexPath
        ) as? FoodCollectionViewCell
        else {
            fatalError("Could not deque cell")
        }

        cell.configure(foodItem: categorizedFoodItems[indexPath.section].products[indexPath.item])
        let cellDelegate = delegate?.foodItemsManagerNeedsDelegateForFoodCell(self)
        cell.delegate = cellDelegate
        return cell
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

        if indexPath == lastIndexPath {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            return
        }

        lastIndexPath = indexPath
        itemForCategoryDelegate?.itemForCategory(self, didSelectCellAt: indexPath)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
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
