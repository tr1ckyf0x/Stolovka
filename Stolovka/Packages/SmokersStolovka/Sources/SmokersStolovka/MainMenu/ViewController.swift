//
//  ViewController.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 29.12.2021.
//

import UIKit
import SharedResources

class ViewController: UIViewController {
    
    private let mainScreenView = StolovkaMainScreenView()
    
    var presenter: MainScreenControllerOutput?
    
    override func loadView() {
        view = mainScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        presenter?.viewDidLoad(mainScreen: self)
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
    
    func setCategoryForItemDelegate(delegate: UICollectionViewDelegate) {
        mainScreenView.categorizedFoodItemsSubview.delegate = delegate
    }
    
    func setCategorizedItemsDataSource(dataSource: UICollectionViewDataSource) {
        mainScreenView.categorizedFoodItemsSubview.dataSource = dataSource
    }
    
}

//MARK: - Navigation Bar Items
extension ViewController {
    
    private func setupview() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(sfSymbol: SFSymbol.takeoutbagAndCupAndStraw), style: .plain, target: self, action: #selector (didTapShoppingCart))
        navigationItem.rightBarButtonItem?.tintColor = SharedResources.Asset.Colors.shoppingCart.color
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(sfSymbol: SFSymbol.threeLinesHorizontal), style: . plain, target: self, action: #selector (didTapMenuButton))
        navigationItem.leftBarButtonItem?.tintColor = SharedResources.Asset.Colors.menu.color
    }
    
    @objc private func didTapShoppingCart() {
        print("Tapped Shopping Cart")
        
    }
    
    @objc private func didTapMenuButton() {
        print("Tapped Menu Button")
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

    func categorizedFoodItemsManagerNeedsDelegateForFoodCell(_ categorizedFoodItemsManager: MainScreenCategorizedFoodItemsCollectionProtocol) -> FoodCollectionViewCellDelegate? {
        return self
    }
}

// MARK: - FoodCollectionViewCellDelegate
extension ViewController: FoodCollectionViewCellDelegate {
    func foodCollectionViewCellDidPressAddToCartButton(_ foodCollectionViewCell: FoodCollectionViewCell) {
        print("added to cart")
    }
    
    func foodCollectionViewCellDidPressLikeButton(foodCollectionViewCell: FoodCollectionViewCell, likeButtonPressedFor foodItem: FoodItem) {
        print("Liked an Item")
        print(foodItem)
    }
}


