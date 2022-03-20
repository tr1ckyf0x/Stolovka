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

// TODO: remove quantity placeholder, arrangeViews, implement correct constraints for items.
protocol ShoppingCartViewCellDelegate: AnyObject {
    func shoppingCartViewCell(_ foodCollectionViewCell: ShoppingCartTableViewCell, pressedAddOneItem foodItem: FoodItem)
    func shoppingCartViewCell(_ foodCollectionViewCell: ShoppingCartTableViewCell, pressedRemoveOneItem foodItem: FoodItem)
}

class ShoppingCartTableViewCell: UITableViewCell {

    private var foodItem: FoodItem?
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
        label.textAlignment = .center
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 22)
        label.minimumScaleFactor = 0.6
        label.text = "1"
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

    private func setupView() {
        self.backgroundColor = UIColor.red
        [
            quantityLabel,
            itemImageView,
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
    }

    @objc
    private func pressedAddOneItem() {
        guard let foodItem = foodItem else { return }
        delegate?.shoppingCartViewCell(self, pressedAddOneItem: foodItem)
    }

    @objc
    private func pressedRemoveOneItem() {
        guard let foodItem = foodItem else { return }
        delegate?.shoppingCartViewCell(self, pressedRemoveOneItem: foodItem)
    }

    private func configureItemImage(for imageSource: PictureFormat) {
        switch imageSource {
        case let .local(imageAsset):
            itemImageView.image = imageAsset.image
        }
    }

    private func configurePriceLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3

        let number = NSNumber(value: price)
        guard let formattedValue = formatter.string(from: number) else { return }

        itemPriceLabel.text = SharedResources.L10n.roubles(formattedValue)
    }
}

// MARK: - Public methods
extension ShoppingCartTableViewCell {

    func configure(foodItem: FoodItem) {
        itemNameLabel.text = foodItem.name
        configurePriceLabelText(for: foodItem.price)
        configureItemImage(for: foodItem.pictureUrl)
    }
}
