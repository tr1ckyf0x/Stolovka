//
//  ItemCategoryCollectionVIewCell.swift
//  Stolovka
//
//  Created by Nikita Shvad on 12.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit
import SharedResources

class ItemCategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var itemCategoryLabel: UILabel = {
        let itemCategoryLabel = UILabel()
        itemCategoryLabel.textColor = SharedResources.Asset.Colors.primaryText.color
        itemCategoryLabel.font = .systemFont(ofSize: 14)
        return itemCategoryLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}


//MARK: - Public Methods
extension ItemCategoryCollectionViewCell {
    func configure(productCategory: ProductCategory) {
        itemCategoryLabel.text = productCategory.title
    }
}
//MARK: - PrivateMethods
extension ItemCategoryCollectionViewCell {
    private func setupView() {
        addSubview(itemCategoryLabel)
        itemCategoryLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(2)
        }
    }
}
