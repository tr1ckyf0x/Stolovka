//
//  Created by Nikita Shvad on 11.05.2022.
//
import UIKit
import SharedResources
import SnapKit

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
        label.textColor = Asset.Colors.secondaryText.color
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryText.color
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
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

// MARK: - Public Methods
extension ShoppingCartPurchaseBlockView {
    public func configureView(viewModel: PurchaseBlockViewModel) {
        numberOfItemsLabel.text = SharedResources.L10n.goods(viewModel.quantity)
        totalPriceLabel.text = SharedResources.L10n.roubles(viewModel.totalPrice)
    }
}

// MARK: - Private Methods
extension ShoppingCartPurchaseBlockView {
    func setupView() {
        self.backgroundColor = Asset.Colors.purchaseBlockViewBackground.color

        [
            purchaseButton,
            numberOfItemsLabel,
            totalPriceLabel
        ].forEach(addSubview(_:))

        purchaseButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(150)
        }

        totalPriceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalTo(purchaseButton.snp.centerY)
            make.leading.equalToSuperview().inset(8)
        }

        numberOfItemsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.top.equalToSuperview()
            make.bottom.equalTo(purchaseButton.snp.centerY)
        }
    }

    @objc
    private func purchaseButtonPressed() {
        delegate?.shoppingCartPurchaseBlockViewDidPressPurchase(self)
    }
}
