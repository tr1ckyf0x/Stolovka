//
//  RecommendationsCollectionView.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

class IndividualItemView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(itemHeading)
        scrollView.addSubview(itemDescriptionLabel)
        scrollView.addSubview(individualItemCollectionView)
        scrollView.addSubview(addToCartBigButton)
        return scrollView
    }()
    private lazy var itemHeading: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.text = "Булочка с присыпкой"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Очень вкусная булочка, ты ее очень любишь. Крутая булочка. Ну было и было. И что теперь? Булочка всё равно хороша."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var individualItemCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "\(FoodCollectionViewCell.self)")
        return collectionView
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.spaceBetweenCards
        flowLayout.minimumLineSpacing = Constants.spaceBetweenCards
        flowLayout.sectionInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private lazy var addToCartBigButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    var scrollToIndexPath: IndexPath?
    
    private var collectionViewHeightConstraint: LayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Was not implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = individualItemCollectionView.frame.width
        let height = collectionViewHeightForWidth(width: width)
        collectionViewHeightConstraint?.constant = height
        self.layoutIfNeeded()
    }
    
}
//MARK: - Private Methods
extension IndividualItemView {
    
    private func setupView() {
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
        
        backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        
        individualItemCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(individualItemCollectionView.snp.width)
        }
        
        itemHeading.snp.makeConstraints { make in
            make.bottom.equalTo(individualItemCollectionView.snp.top)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(8)
        }
        
        itemDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(individualItemCollectionView.snp.bottom).multipliedBy(1.050)
            make.left.right.equalToSuperview().inset(8)
        }
    }
    
    private func collectionViewHeightForWidth(width: CGFloat) -> CGFloat {
        let spacing = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * Constants.spacesBetweenCardsCount
        let itemDimension = (availableWidth / Constants.shownCardsCount).rounded(.down)
        return itemDimension
    }
}

extension IndividualItemView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionViewHeightForWidth(width: width)
        return CGSize(width: height, height: height)
    }
}

extension IndividualItemView {
    private enum Constants {
        static let spaceBetweenCards: CGFloat = 0
        static let shownCardsCount: CGFloat = 1
        static let spacesBetweenCardsCount: CGFloat = shownCardsCount.rounded() - 1
    }
}
//MARK: - Public Methods
extension IndividualItemView {
    
    func scrollToItem() {
        guard let scrollToIndexPath = scrollToIndexPath else { return }
        individualItemCollectionView.scrollToItem(at: scrollToIndexPath, at: .left, animated: false)
    }
    
    var dataSource: UICollectionViewDataSource? {
        get {
            individualItemCollectionView.dataSource
        }
        set {
            individualItemCollectionView.dataSource = newValue
        }
    }
    
    func reloadCollection() {
        individualItemCollectionView.reloadData()
    }
    
    var indexPath: IndexPath? {
        get {
            scrollToIndexPath
        }
        set {
            scrollToIndexPath = newValue
        }
    }
}

