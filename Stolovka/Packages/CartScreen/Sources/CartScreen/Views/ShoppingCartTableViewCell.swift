//
//
//
//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import SharedResources
import UIKit
import UIComponents
import SnapKit
import Models

protocol ShoppingCartViewCellDelegate: AnyObject {
    func shoppingCartViewCell(
        _ foodCollectionViewCell: ShoppingCartTableViewCell,
        didPressAddOneItem foodItem: CountableContainer<FoodItem>
    )
    func shoppingCartViewCell(
        _ foodCollectionViewCell: ShoppingCartTableViewCell,
        didPressRemoveOneItem foodItem: CountableContainer<FoodItem>
    )
}

final class ShoppingCartTableViewCell: UITableViewCell {

    private var shoppingCartFoodItem: CountableContainer<FoodItem>?
    weak var delegate: ShoppingCartViewCellDelegate?

    private var stepper = Stepper(stepperType: .vertical)

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }
}

// MARK: - Public methods
extension ShoppingCartTableViewCell {

    func configure(shoppingCartFoodItem: CountableContainer<FoodItem>) {
        self.shoppingCartFoodItem = shoppingCartFoodItem
        let foodItem = shoppingCartFoodItem.item
        itemNameLabel.text = foodItem.name
        itemDescriptionLabel.text = foodItem.description
        configurePriceLabelText(for: foodItem.price)
        configureItemImage(for: foodItem.pictureUrl)
    }
}

// MARK: - Private methods
extension ShoppingCartTableViewCell {
    // swiftlint:disable:next function_body_length
    private func setupView() {
        self.backgroundColor = Asset.Colors.tableViewBackground.color
        [
            itemImageView,
            itemDescriptionLabel,
            itemNameLabel,
            itemPriceLabel,
            stepper
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
        }

        itemDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(itemNameLabel.snp.left)
            make.top.equalTo(itemNameLabel.snp.bottom).offset(8)
            make.height.equalTo(itemImageView.snp.height).multipliedBy(0.21)
            make.width.equalToSuperview().multipliedBy(0.55)
        }

        itemPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(itemNameLabel.snp.left)
            make.top.equalTo(itemDescriptionLabel.snp.bottom).offset(8)
            make.height.equalTo(itemImageView.snp.height).multipliedBy(0.21)
        }

        stepper.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalTo(itemDescriptionLabel.snp.right)
           // make.width.equalTo(40)
        }

    }

    @objc
    private func pressedAddOneItem() {
        guard let foodItem = shoppingCartFoodItem else { return }
        delegate?.shoppingCartViewCell(self, didPressAddOneItem: foodItem)
    }

    @objc
    private func pressedRemoveOneItem() {
        guard let foodItem = shoppingCartFoodItem else { return }
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
}
