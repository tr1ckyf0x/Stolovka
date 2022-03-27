//
//  ProductCollectionCell.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SharedResources
import SharedModels
import ProductModels

final class ProductCollectionCell: UICollectionViewCell {

    private lazy var priceLabel: UILabel = { label in
        label
    }(UILabel())

    private lazy var addToCartButton: UIButton = { button in
        let image = UIImage(sfSymbol: SFSymbol.plusCircle)
        button.setImage(image, for: .normal)
        return button
    }(UIButton(type: .system))

    private lazy var productImageView: UIImageView = { imageView in
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }(UIImageView())

    private lazy var productTitleLabel: UILabel = { label in
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 12 / label.font.pointSize
        label.textAlignment = .center
        return label
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        priceLabel.text = nil
        productImageView.image = nil
    }
}

// MARK: - Public methods
extension ProductCollectionCell {
    func configure(product: MainScreenProduct) {
        configurePriceLabelText(for: product.price)
        configureProductImage(for: product.image)
        productTitleLabel.text = product.name
    }
}

// MARK: - Private methods
extension ProductCollectionCell {
    private func setupViews() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.secondarySystemBackground

        [
            priceLabel,
            addToCartButton,
            productTitleLabel,
            productImageView
        ].forEach(contentView.addSubview(_:))

        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.lessThanOrEqualTo(addToCartButton.snp.leading).offset(-8)
            make.bottom.equalToSuperview().inset(8)
        }

        addToCartButton.snp.makeConstraints { make in
            make.centerY.equalTo(priceLabel)
            make.trailing.equalToSuperview().inset(16)
        }

        productTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(addToCartButton.snp.top).offset(-8)
        }

        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalTo(productTitleLabel.snp.top).offset(-4)
            make.width.equalTo(productImageView.snp.height)
            make.centerX.equalToSuperview()
        }

        addToCartButton.setContentCompressionResistancePriority(.required, for: .vertical)
        priceLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        productTitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    private func configurePriceLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        let number = NSNumber(value: price)
        guard let formattedValue = formatter.string(from: number) else { return }

        priceLabel.text = SharedResources.L10n.roubles(formattedValue)
    }

    private func configureProductImage(for imageSource: ImageSource) {
        // TODO: Create UseCase for image loading
        switch imageSource {
        case let .local(imageAsset):
            productImageView.image = imageAsset.image
        }
    }
}
