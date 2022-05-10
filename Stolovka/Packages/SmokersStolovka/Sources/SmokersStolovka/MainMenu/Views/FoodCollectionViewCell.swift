//
//  RecommendationsCollectionViewCell.swift
//  Stolovka
//
//  Created by Nikita Shvad on 08.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SharedResources
import Models

protocol FoodCollectionViewCellDelegate: AnyObject {
    func foodCollectionViewCell(_ foodCollectionViewCell: FoodCollectionViewCell, didPressLikeButtonFor foodItem: FoodItem)
    func foodCollectionViewCell(_ foodCollectionViewCell: FoodCollectionViewCell, didPressAddToCartButtonFor foodItem: FoodItem)
}

class FoodCollectionViewCell: UICollectionViewCell {
    private var foodItem: FoodItem?
    weak var delegate: FoodCollectionViewCellDelegate?

    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
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

// MARK: - Private Methods
extension FoodCollectionViewCell {
    private func setupView() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 10

        [
            likeButton,
            itemImage,
            productTitleLabel,
            productPriceLabel,
            addToCartButton
        ].forEach(addSubview(_:))

        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().inset(8)
            // Magic number calculated by dividing intrinsic height by width
            make.height.equalTo(likeButton.snp.width).multipliedBy(0.8875140607)
        }

        itemImage.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.bottom)
            make.bottom.equalTo(productTitleLabel.snp.top)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        productTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(addToCartButton.snp.top)
        }

        productPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.trailing.lessThanOrEqualTo(addToCartButton.snp.leading).offset(-8)
            make.bottom.equalToSuperview().inset(6)
        }

        addToCartButton.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.width.equalTo(addToCartButton.snp.height)
            make.bottom.equalToSuperview().inset(6)
            make.trailing.equalToSuperview().inset(8)
        }

        itemImage.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

    @objc
    private func pressedHeartButton() {
        guard let foodItem = foodItem else { return }
        delegate?.foodCollectionViewCell(self, didPressLikeButtonFor: foodItem)
    }

    @objc
    private func pressedAddToCartButton() {
        guard let foodItem = foodItem else { return }
        delegate?.foodCollectionViewCell(self, didPressAddToCartButtonFor: foodItem)
    }

    private func configurePriceLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0

        let number = NSNumber(value: price)
        guard let formattedValue = formatter.string(from: number) else { return }

        productPriceLabel.text = SharedResources.L10n.roubles(formattedValue)
    }

    private func configureProductImage(for imageSource: PictureFormat) {
        switch imageSource {
        case let .local(imageAsset):
            itemImage.image = imageAsset.image

        #if DEBUG

        case .test:
            break

        #endif
        }
    }
}

// MARK: - Public Methods
extension FoodCollectionViewCell {
    func configure(foodItem: FoodItem) {
        self.foodItem = foodItem
        let notLikedByUserImage = UIImage(sfSymbol: SFSymbol.heart)
        let likedByUserImage = UIImage(sfSymbol: SFSymbol.heartFill)
        configurePriceLabelText(for: foodItem.price)
        configureProductImage(for: foodItem.pictureUrl)
        productTitleLabel.text = foodItem.name
        foodItem.isLikedByUser ? likeButton.setImage(likedByUserImage, for: .normal) : likeButton.setImage(notLikedByUserImage, for: .normal)
    }
}
