

import Foundation
import UIKit

final class CategoryForItemManager: NSObject {
    var categorizedFoodItems = [CategorizedFoodItems]()
    
}

extension CategoryForItemManager: MainScreenItemCategoryProtocol {
    
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }
}

extension CategoryForItemManager: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categorizedFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        return categorizedFoodItems[section].products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ItemCategoryCollectionViewCell.self)", for: indexPath) as? ItemCategoryCollectionViewCell {
            cell.configure(productCategory: categorizedFoodItems[indexPath.section].category)
            return cell
        }
        
        fatalError("Could not deque the ItemCategory cell")
    }
}
