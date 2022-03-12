//
//  ViewController.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 29.12.2021.
//

import UIKit
import SharedResources
import NavigationController

class ViewController: UIViewController {
    
    private let mainScreenView = StolovkaMainScreenView()
    var mainScreenNavigationController: NavigationControllerProtocol?
    
    var presenter: MainScreenControllerOutput?
    
    override func loadView() {
        view = mainScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        presenter?.viewDidLoad(self)
    }
   
    func setRecommendationsDataSource(dataSource: UICollectionViewDataSource) {
        mainScreenView.recommendationsSubview.dataSource = dataSource
    }
    
    func setItemCategoryCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        mainScreenView.itemCategoryCollectionView.dataSource = dataSource
    }
    
    func setItemCategoryDelegate(delegate: UICollectionViewDelegate) {
        mainScreenView.itemCategoryCollectionView.delegate = delegate
    }
    
    func setCategorizedFoodItemsDelegate(delegate: UICollectionViewDelegate) {
        mainScreenView.categorizedFoodItemsSubview.delegate = delegate
    }
    
    func setCategorizedItemsDataSource(dataSource: UICollectionViewDataSource) {
        mainScreenView.categorizedFoodItemsSubview.dataSource = dataSource
    }
    
}

//MARK: - Navigation Bar Items
extension ViewController {
    
    private func setupview() {
        mainScreenNavigationController.setupMainScreenNavigation(for: self)
    }
}

extension ViewController: MainScreenControllerInput {
    
    func reloadRecommendationsTitles() {
        mainScreenView.itemCategoryCollectionView.reloadCollection()
    }
    
    
    func reloadCategorizedItemsCollection() {
        mainScreenView.categorizedFoodItemsSubview.reloadCollection()
    }
    
    
    func reloadRecommendationsCollection() {
        mainScreenView.recommendationsSubview.reloadCollection()
    }
    
    func loadViews() {
        mainScreenView.recommendationsSubview.title = SharedResources.L10n.recommendations
    }
    
    func setGreeting(model: ChumBucketGreetingModel) {
        mainScreenView.greetingSubview.greetingText = model.greeting
        mainScreenView.greetingSubview.quoteOfTheDayText = model.quoteOfTheDay
    }

    func scrollCategorizedItems(to indexPath: IndexPath) {
        mainScreenView.categorizedFoodItemsSubview.scroll(to: indexPath)
    }
    
    func scrollItemCategories(to indexPath: IndexPath) {
        mainScreenView.itemCategoryCollectionView.scroll(to: indexPath)
    }
}

// MARK: - CategorizedFoodItemsManagerDelegate
extension ViewController: FoodItemCarouselDelegate {
    func foodItemsManagerNeedsDelegateForFoodCell(_ foodItemsCollectionManager: MainScreenFoodItemsCollectionManagerProtocol) -> FoodCollectionViewCellDelegate? {
        self
    }
}

// MARK: - FoodCollectionViewCellDelegate
extension ViewController: FoodCollectionViewCellDelegate {
    func foodCollectionViewCell(_ foodCollectionViewCell: FoodCollectionViewCell, didPressLikeButtonFor foodItem: FoodItem) {
        presenter?.view(self, didTapLikeButtonFor: foodItem)
    }

    func foodCollectionViewCell(_ foodCollectionViewCell: FoodCollectionViewCell, didPressAddToCartButtonFor foodItem: FoodItem) {
        presenter?.view(self, didTapAddButtonFor: foodItem)
    }
}
