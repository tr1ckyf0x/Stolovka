//
//  ProductCarouselView.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SnapKit

final class ProductCarouselView: UIView {

    private lazy var titleLabel: UILabel = { label in
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryText.color
        return label
    }(UILabel())

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = Constants.spaceBetweenCards
        layout.minimumLineSpacing = Constants.spaceBetweenCards
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
        layout.scrollDirection = .horizontal
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ProductCollectionCell.self, forCellWithReuseIdentifier: "\(ProductCollectionCell.self)")
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    private var collectionViewHeightConstraint: LayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = collectionView.frame.width
        let height = collectionCellHeight(for: width)
        collectionViewHeightConstraint?.constant = height
        self.layoutIfNeeded()
    }
}

// MARK: - Public methods
extension ProductCarouselView {
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    var dataSource: UICollectionViewDataSource? {
        get {
            collectionView.dataSource
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    func reloadCollection() {
        collectionView.reloadData()
    }
}

// MARK: - Private methods
extension ProductCarouselView {
    private func setupViews() {
        [
            titleLabel,
            collectionView
        ].forEach(addSubview(_:))

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            self.collectionViewHeightConstraint = make.height.equalTo(1).constraint.layoutConstraints.first
        }
    }

    private func collectionCellHeight(for width: CGFloat) -> CGFloat {
        let spacing = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * Constants.spacesBetweenCardsCount
        let itemDimension = (availableWidth / Constants.shownCardsCount).rounded(.down)
        return itemDimension
    }
}

extension ProductCarouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionCellHeight(for: width)
        return CGSize(width: height, height: height)
    }
}

extension ProductCarouselView {
    enum Constants {
        static let shownCardsCount: CGFloat = 2.3
        static let spaceBetweenCards: CGFloat = 16
        static let spacesBetweenCardsCount = shownCardsCount.rounded(.down) + 1
    }
}
