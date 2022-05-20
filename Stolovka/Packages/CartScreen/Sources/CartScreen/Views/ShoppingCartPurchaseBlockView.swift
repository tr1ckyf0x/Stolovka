//
//  Created by Nikita Shvad on 11.05.2022.
//
import UIKit
import SharedResources
import SnapKit
import Models

protocol ShoppingCartPurchaseBlockViewDelegate: AnyObject {
    func shoppingCartPurchaseBlockViewDidPressPurchase(
        _ shoppingCartPurchaseBlockView: ShoppingCartPurchaseBlockView
    )
}

class ShoppingCartPurchaseBlockView: UIView {

    weak var delegate: ShoppingCartPurchaseBlockViewDelegate?

    let calculationView = UIView()
    let purchaseView = UIView()

    private lazy var purchaseButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitleColor(SharedResources.Asset.Colors.tableViewBackground.color, for: .normal)
        button.backgroundColor = SharedResources.Asset.Colors.shoppingCart.color
        button.setTitle(SharedResources.L10n.purchase, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.4
        button.tintColor = SharedResources.Asset.Colors.secondaryText.color
        button.addTarget(self, action: #selector(purchaseButtonPressed), for: .touchUpInside)
        return button
    }()

    // Todo: Count Total number and price of items, remove strings
    private lazy var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.9
        label.text = "1 Товар"
        label.textColor = Asset.Colors.secondaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryText.color
        label.textAlignment = .left
        label.text = "1453 Р"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension ShoppingCartPurchaseBlockView {
    func setupView() {
        [
            calculationView,
            purchaseView
        ].forEach(addSubview(_:))

        purchaseView.addSubview(purchaseButton)

        [
            numberOfItemsLabel,
            totalPriceLabel
        ].forEach(calculationView.addSubview(_:))

        purchaseView.backgroundColor = Asset.Colors.purchaseBlockViewBackground.color
        calculationView.backgroundColor = Asset.Colors.purchaseBlockViewBackground.color

        purchaseView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(purchaseView.snp.width).multipliedBy(0.4)
            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        purchaseButton.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }

        calculationView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalTo(purchaseView.snp.left)
            make.height.equalTo(purchaseView.snp.width).multipliedBy(0.4)
            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        numberOfItemsLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalTo(calculationView.snp.centerY)
        }

        totalPriceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(calculationView.snp.centerY)
        }

    }

    @objc
    private func purchaseButtonPressed() {
        delegate?.shoppingCartPurchaseBlockViewDidPressPurchase(self)
    }
}
