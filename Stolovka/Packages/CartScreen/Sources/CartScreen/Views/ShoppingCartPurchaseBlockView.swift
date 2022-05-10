//
//  Created by Nikita Shvad on 11.05.2022.
//
import UIKit
import SharedResources
import SnapKit

class ShoppingCartPurchaseBlockView: UIView {

    private lazy var purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(SharedResources.Asset.Colors.tableViewBackground.color, for: .normal)
        button.backgroundColor = SharedResources.Asset.Colors.shoppingCart.color
        button.setTitle(SharedResources.L10n.purchase, for: .normal)
        button.addTarget(self, action: #selector(purchaseButtonPressed), for: .touchDown)
        return button
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
        self.backgroundColor = Asset.Colors.stepperBackground.color
        self.addSubview(purchaseButton)
        purchaseButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(purchaseButton.snp.width).multipliedBy(0.1)
        }
    }

    @objc
    private func purchaseButtonPressed() {
        print("Purchased")
    }
}
