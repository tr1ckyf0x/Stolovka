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
            itemNameLabel,
            stepper,
            itemDescriptionLabel,
            itemPriceLabel
        ].forEach(contentView.addSubview(_:))

        itemImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.height.equalTo(itemImageView.snp.width).priority(999)
            make.width.equalTo(110)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        stepper.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
            make.height.equalTo(itemImageView.snp.height).inset(10)
            make.width.equalTo(30)
        }

        itemNameLabel.snp.makeConstraints { make in
            make.top.equalTo(itemImageView.snp.top)
            make.height.equalTo(35)
            make.leading.equalTo(itemImageView.snp.trailing).inset(-8)
            make.trailing.equalTo(stepper.snp.leading)
        }

        itemDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemNameLabel.snp.leading)
            make.top.equalTo(itemNameLabel.snp.bottom)
            make.height.equalTo(45)
            make.trailing.equalTo(stepper.snp.leading)

        }

        itemPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(itemDescriptionLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.trailing.equalTo(stepper.snp.leading)
            make.leading.equalTo(itemNameLabel.snp.leading)
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
