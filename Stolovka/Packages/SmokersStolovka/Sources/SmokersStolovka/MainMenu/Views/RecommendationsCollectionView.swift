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

class RecommendationsCollectionView: UIView {
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var recommendationsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "\(FoodCollectionViewCell.self)")
        return collectionView
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.spaceBetweenCards
        flowLayout.minimumLineSpacing = Constants.spaceBetweenCards
        flowLayout.sectionInset = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
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
        let width = recommendationsCollectionView.frame.width
        let height = collectionViewHeightForWidth(width: width)
        collectionViewHeightConstraint?.constant = height
        self.layoutIfNeeded()
    }
    
}
    //MARK: - Private Methods
extension RecommendationsCollectionView {
    
    private func setupView() {
        addSubview(headingLabel)
        addSubview(recommendationsCollectionView)
        
        headingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
        
        recommendationsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headingLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            self.collectionViewHeightConstraint = make.height.equalTo(1).constraint.layoutConstraints.first
        }
    }
    
    private func collectionViewHeightForWidth(width: CGFloat) -> CGFloat {
        let spacing = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * Constants.spacesBetweenCardsCount
        let itemDimension = (availableWidth / Constants.shownCardsCount).rounded(.down)
        return itemDimension
    }
}

extension RecommendationsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionViewHeightForWidth(width: width)
        return CGSize(width: height, height: height)
    }
}

extension RecommendationsCollectionView {
    private enum Constants {
        static let spaceBetweenCards: CGFloat = 16
        static let shownCardsCount: CGFloat = 2.3
        static let spacesBetweenCardsCount: CGFloat = shownCardsCount.rounded() - 1
    }
}
//MARK: - Public Methods
extension RecommendationsCollectionView {
   
    var title: String? {
        get {
            headingLabel.text
        }
        set {
            headingLabel.text = newValue
        }
    }
   
    var dataSource: UICollectionViewDataSource? {
        get {
            recommendationsCollectionView.dataSource
        }
        set {
            recommendationsCollectionView.dataSource = newValue
            
        }
    }
    
    func reloadCollection() {
        recommendationsCollectionView.reloadData()
    }
}

