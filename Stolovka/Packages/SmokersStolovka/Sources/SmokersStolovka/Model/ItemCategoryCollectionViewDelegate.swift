//
//  File.swift
//  
//
//  Created by Nikita Shvad on 13.01.2022.
//

import Foundation
import UIKit

//protocol ItemSpacesProtocol {
//    var minimalItemSpacing: CGFloat { get }
//    var numberOfItemsOnScreen: CGFloat { get }
//    var spacesBetweenItems: CGFloat { get }
//}

class ItemCategoryCollectionViewDelegate: NSObject {
    var lastIndexPath: IndexPath?
    // Delegate must take constants from the view it is delegating. This implementation is wrong.
    private enum Constants {
        static let minimalItemSpacing: CGFloat = 16.0
        static let numberOfItemsOnScreen: CGFloat = 2.2
        static let spacesBetweenItems: CGFloat = numberOfItemsOnScreen.rounded() - 1
    }
    let collectionView2 = CategorizedFoodItemsCollectionView()
    
    override init() {
        super.init()
        lastIndexPath = IndexPath(row: 0, section: 0)
    }
}

extension ItemCategoryCollectionViewDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ItemCategoryCollectionViewCell {
            if let lastIndexPath = lastIndexPath {
                collectionView.deselectItem(at: lastIndexPath, animated: true)
            }
            lastIndexPath = indexPath
            cell.configureView(selected: true)
            collectionView2.configureCollectionView(indexPath: indexPath)
        }
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        print("Selected Item")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ItemCategoryCollectionViewCell {
            cell.configureView(selected: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let lastIndexPath = lastIndexPath {
            if let cell = collectionView.cellForItem(at: lastIndexPath) as? ItemCategoryCollectionViewCell {
                collectionView.selectItem(at: lastIndexPath, animated: true, scrollPosition: .centeredHorizontally)
                cell.configureView(selected: true)
            }
        }
    }
}

extension ItemCategoryCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - (Constants.numberOfItemsOnScreen * Constants.minimalItemSpacing)) / Constants.numberOfItemsOnScreen
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
