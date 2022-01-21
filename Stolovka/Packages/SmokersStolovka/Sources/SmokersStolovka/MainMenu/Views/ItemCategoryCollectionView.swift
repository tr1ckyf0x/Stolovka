//
//  CategorizedFoodCollectionViewItemsHeadings.swift
//  Stolovka
//
//  Created by Nikita Shvad on 12.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

class ItemCategoryCollectionView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.register(ItemCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "\(ItemCategoryCollectionViewCell.self)")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.minimalItemSpacing
        layout.minimumInteritemSpacing = Constants.minimalItemSpacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return layout
    }()
    
    private var collectionViewHeightConstraint: LayoutConstraint?
    
    override func layoutSubviews() {
        let width = self.bounds.width
        let height = collectionviewHeightForWidth(width: width)
        collectionViewHeightConstraint?.constant = height
        self.layoutIfNeeded()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Was not implemented")
    }
}
//MARK: - Public Methods

extension ItemCategoryCollectionView {
    var dataSource: UICollectionViewDataSource? {
        
        get {
            return collectionView.dataSource
        }
        
        set {
            return collectionView.dataSource = newValue
        }
    }
    
    var delegate: UICollectionViewDelegate? {
        
        get {
            return collectionView.delegate
        }
        
        set {
            return collectionView.delegate = newValue
        }
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
    
    func scroll(to indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

//MARK: - private methods
extension ItemCategoryCollectionView {
    
    private func setupView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            self.collectionViewHeightConstraint = make.height.equalTo(1).constraint.layoutConstraints.first
        }
    }
    
    private func collectionviewHeightForWidth(width: CGFloat) -> CGFloat {
        let spacing = flowLayout.minimumInteritemSpacing
        let totalAvailibleWidth = width - (Constants.spacesBetweenItems * spacing)
        let itemDimension = (totalAvailibleWidth / Constants.numberOfItemsOnScreen).rounded(.down)
        let heightForItem = itemDimension * 0.19
        return heightForItem
    }
}

extension ItemCategoryCollectionView {
    private enum Constants {
        static let minimalItemSpacing: CGFloat = 16.0
        static let numberOfItemsOnScreen: CGFloat = 2.2
        static let spacesBetweenItems: CGFloat = numberOfItemsOnScreen.rounded() - 1
    }
}

