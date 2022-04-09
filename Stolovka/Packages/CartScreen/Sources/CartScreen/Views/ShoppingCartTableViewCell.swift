//
//
//
//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import SharedResources
import UIKit
import SnapKit
import Models

protocol ShoppingCartViewCellDelegate: AnyObject {
    func shoppingCartViewCell(_ foodCollectionViewCell: ShoppingCartTableViewCell, didPressAddOneItem foodItem: FoodItem)
    func shoppingCartViewCell(_ foodCollectionViewCell: ShoppingCartTableViewCell, didPressRemoveOneItem foodItem: FoodItem)
}

final class ShoppingCartTableViewCell: UITableViewCell {

    private var shoppingCartFoodItem: CountableContainer<FoodItem>?
    weak var delegate: ShoppingCartViewCellDelegate?

    private lazy var itemImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 22)
        label.minimumScaleFactor = 0.6
        return label
    }()

    private lazy var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = SharedResources.Asset.Colors.secondaryText.color
        label.font = .systemFont(ofSize: 14)
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var itemPriceLabel: UILabel = {
        var label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()

    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.layer.borderColor = SharedResources.Asset.Colors.primaryText.color.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 22)
        label.minimumScaleFactor = 0.6
        label.backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        return label
    }()

    private lazy var addOneItemButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(sfSymbol: SFSymbol.plusCircle)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(pressedAddOneItem), for: .touchUpInside)
        return button
    }()

    private lazy var removeOneItemButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(sfSymbol: SFSymbol.minusCircle)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(pressedRemoveOneItem), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard #available(iOS 13.0, *) else { return }
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        quantityLabel.layer.borderColor = SharedResources.Asset.Colors.primaryText.color.cgColor
    }
}

// MARK: - Public methods
extension ShoppingCartTableViewCell {

    func configure(shoppingCartFoodItem: CountableContainer<FoodItem>) {
        let foodItem = shoppingCartFoodItem.item
        itemNameLabel.text = foodItem.name
        itemDescriptionLabel.text = foodItem.description
        configurePriceLabelText(for: foodItem.price)
        configureItemImage(for: foodItem.pictureUrl)
        configureItemQuantity(for: shoppingCartFoodItem.quantity)
    }
}

// MARK: - Private methods
extension ShoppingCartTableViewCell {
    // swiftlint:disable:next function_body_length
    private func setupView() {
        self.backgroundColor = Asset.Colors.tableViewBackground.color
        [
            quantityLabel,
            itemImageView,
            itemDescriptionLabel,
            itemNameLabel,
            addOneItemButton,
            removeOneItemButton,
            itemPriceLabel
        ].forEach(contentView.addSubview(_:))

        itemImageView.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.32)
            make.height.equalTo(itemImageView.snp.width).priority(999)
        }

        itemNameLabel.snp.makeConstraints { make in
            make.left.equalTo(itemImageView.snp.right).offset(10)
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(itemImageView.snp.height).multipliedBy(0.21)
            make.right.equalTo(quantityLabel.snp.right)
        }

        quantityLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
            make.width.equalTo(quantityLabel.snp.height)
        }

        itemDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(itemNameLabel.snp.left)
            make.top.equalTo(itemNameLabel.snp.bottom).offset(8)
            make.height.equalTo(itemImageView.snp.height).multipliedBy(0.21)
            make.right.equalTo(quantityLabel.snp.left)
        }

        itemPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(itemNameLabel.snp.left)
            make.top.equalTo(itemDescriptionLabel.snp.bottom).offset(8)
            make.height.equalTo(itemImageView.snp.height).multipliedBy(0.21)
            make.right.equalTo(quantityLabel.snp.right)
        }

        addOneItemButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.height.equalToSuperview().multipliedBy(0.13)
            make.width.equalTo(addOneItemButton.snp.height)
            make.right.equalTo(quantityLabel.snp.right)
        }

        removeOneItemButton.snp.makeConstraints { make in
            make.bottom.equalTo(addOneItemButton.snp.bottom)
            make.height.width.equalTo(addOneItemButton.snp.height)
            make.left.equalTo(quantityLabel.snp.left)
        }
    }

    @objc
    private func pressedAddOneItem() {
        guard let foodItem = shoppingCartFoodItem?.item else { return }
        delegate?.shoppingCartViewCell(self, didPressAddOneItem: foodItem)
    }

    @objc
    private func pressedRemoveOneItem() {
        guard let foodItem = shoppingCartFoodItem?.item else { return }
        delegate?.shoppingCartViewCell(self, didPressRemoveOneItem: foodItem)
    }

    private func configureItemImage(for imageSource: PictureFormat) {
        switch imageSource {
        case let .local(imageAsset):
            itemImageView.image = imageAsset.image

        #if DEBUG

        case .test:
            break

        #endif
        }
    }

    private func configurePriceLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0

        let number = NSNumber(value: price)
        guard let formattedValue = formatter.string(from: number) else { return }

        itemPriceLabel.text = SharedResources.L10n.roubles(formattedValue)
    }

    private func configureItemQuantity(for quantity: Int) {
        quantityLabel.text = String(quantity)
    }
}
