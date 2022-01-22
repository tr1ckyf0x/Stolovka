
import UIKit

protocol CategoryForItemManagerDelegate: AnyObject {
    func categoryForItemManager(_ categoryForItemManager: MainScreenItemCategoryProtocol, didSelectCellAt indexPath: IndexPath)
}

final class CategoryForItemManager: NSObject {
    private var categorizedFoodItems = [CategorizedFoodItems]()
    private var lastIndexPath = IndexPath(row: 0, section: 0)

    weak var delegate: CategoryForItemManagerDelegate?
}

// MARK: - MainScreenItemCategoryProtocol
extension CategoryForItemManager: MainScreenItemCategoryProtocol {
    func setupItemCategories(_ categorizedFoodItems: [CategorizedFoodItems]) {
        self.categorizedFoodItems = categorizedFoodItems
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryForItemManager: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categorizedFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ItemCategoryCollectionViewCell.self)", for: indexPath) as? ItemCategoryCollectionViewCell else { fatalError("Could not deque cell") }
            cell.configure(productCategory: categorizedFoodItems[indexPath.section].category)
            return cell
        }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryForItemManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - (Constants.numberOfItemsOnScreen * Constants.minimalItemSpacing)) / Constants.numberOfItemsOnScreen
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ItemCategoryCollectionViewCell {
            collectionView.deselectItem(at: lastIndexPath, animated: true)
            lastIndexPath = indexPath
            cell.configureView(isSelected: true)
            delegate?.categoryForItemManager(self, didSelectCellAt: indexPath)
        }

        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ItemCategoryCollectionViewCell {
            cell.configureView(isSelected: false)
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: lastIndexPath) as? ItemCategoryCollectionViewCell {
            cell.configureView(isSelected: true)
        }
    }
}

// MARK: - Constants
extension CategoryForItemManager {
    private enum Constants {
        static let minimalItemSpacing: CGFloat = 10
        static let numberOfItemsOnScreen: CGFloat = 2.2
        static let spacesBetweenItems: CGFloat = numberOfItemsOnScreen.rounded() - 1
    }
}
