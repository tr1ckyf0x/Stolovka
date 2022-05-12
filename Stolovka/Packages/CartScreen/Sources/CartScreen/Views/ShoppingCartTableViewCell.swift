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

    let descriptionVIew = UIView()

    private lazy var stepper: Stepper = {
        let stepper = Stepper(style: .vertical)
        stepper.delegate = self
        return stepper
    }()

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
        label.adjustsFontSizeToFitWidth = true
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
        stepper.value = shoppingCartFoodItem.quantity
    }
}

// MARK: - Private methods
extension ShoppingCartTableViewCell {
    private func setupView() {
        self.backgroundColor = Asset.Colors.tableViewBackground.color
        [
            itemImageView,
            descriptionVIew,
            stepper
        ].forEach(contentView.addSubview(_:))

        [
            itemDescriptionLabel,
            itemNameLabel,
            itemPriceLabel
        ].forEach(descriptionVIew.addSubview(_:))

        itemImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.width.equalToSuperview().multipliedBy(0.32)
            make.height.equalTo(itemImageView.snp.width).priority(999)
        }

        stepper.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(stepper.snp.height).multipliedBy(0.5)
        }

        descriptionVIew.snp.makeConstraints { make in
            make.leading.equalTo(itemImageView.snp.trailing)
            make.trailing.equalTo(stepper.snp.leading)
            make.top.bottom.equalToSuperview()
        }

        itemDescriptionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(itemDescriptionLabel.snp.width).multipliedBy(0.3)
        }

        itemNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(itemDescriptionLabel.snp.top).offset(6)
            make.leading.equalTo(itemDescriptionLabel.snp.leading)
            make.trailing.equalTo(itemDescriptionLabel.snp.trailing)
        }

        itemPriceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalTo(itemDescriptionLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
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

// MARK: - StepperDelegate
extension ShoppingCartTableViewCell: StepperDelegate {
    func stepperDidPressIncrement(_ stepper: Stepper) {
        pressedAddOneItem()
    }

    func stepperDidPressDecrement(_ stepper: Stepper) {
        pressedRemoveOneItem()
    }
}
