//
//  Created by Nikita Shvad on 11.05.2022.
//
import UIKit
import SharedResources
import SnapKit

class ShoppingCartPurchaseBlockView: UIView {

    let calculationView = UIView()
    let purchaseView = UIView()

    private lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(SharedResources.Asset.Colors.tableViewBackground.color, for: .normal)
        button.backgroundColor = SharedResources.Asset.Colors.shoppingCart.color
        button.setTitle(SharedResources.L10n.purchase, for: .normal)
        button.addTarget(self, action: #selector(purchaseButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.7
        label.textColor = Asset.Colors.secondaryText.color
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryText.color
        label.textAlignment = .center
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
        purchaseView,
        purchaseButton,
        numberOfItemsLabel,
        totalPriceLabel
        ].forEach(addSubview(_:))

        purchaseView.backgroundColor = .red
        purchaseView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
        }
    }

    @objc
    private func purchaseButtonPressed() {
        print("Purchased")
    }
}
