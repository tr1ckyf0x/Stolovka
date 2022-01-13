//
//  RecommendationsCollectionViewCell.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit
import SharedResources

//TODO: Replace all colors and label string

class FoodCollectionViewCell: UICollectionViewCell {
    
    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        var label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(sfSymbol: SFSymbol.plusCircle)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(pressedAddToCartButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(sfSymbol: SFSymbol.heart)
        button.tintColor = SharedResources.Asset.Colors.shoppingCart.color
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedHeartButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }
}

//MARK: - Private Methods

extension FoodCollectionViewCell {
    private func setupView() {
        contentView.backgroundColor = UIColor.secondarySystemBackground
        contentView.layer.cornerRadius = 10
        
        [likeButton,
        itemImage,
        productTitleLabel,
        productPriceLabel,
        addToCartButton,
        ].forEach(addSubview(_:))
        
        productPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.lessThanOrEqualTo(addToCartButton).inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(productPriceLabel)
            make.centerY.equalTo(productPriceLabel)
        }
        
        productTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(productPriceLabel.snp.height)
            make.bottom.equalTo(addToCartButton.snp.top).offset(-4)
        }
        
        itemImage.snp.makeConstraints { make in
            make.bottom.equalTo(productTitleLabel.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.55)
            make.height.equalTo(itemImage.snp.width)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(itemImage.snp.top).inset(15)
            make.centerX.equalTo(addToCartButton.snp.centerX)
            make.size.equalTo(addToCartButton)
        }
        
        
    }
    
    @objc private func pressedHeartButton() {
        print("Tapped like button")
    }
    
    @objc private func pressedAddToCartButton() {
        print("Tapped add to cart")
    }
    
    private func configurePriceLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3

        let number = NSNumber(value: price)
        let formattedValue = formatter.string(from: number)!

        productPriceLabel.text = SharedResources.L10n.roubles(formattedValue)
    }

    private func configureProductImage(for imageSource: PictureFormat) {
        switch imageSource {
        case let .local(imageAsset):
            itemImage.image = imageAsset.image
        }
    }
}

//MARK: - Public Methods

extension FoodCollectionViewCell {
    func configure(foodItem: FoodItem) {
        configurePriceLabelText(for: foodItem.price)
        configureProductImage(for: foodItem.pictureUrl)
        productTitleLabel.text = foodItem.name
        
    }
}
