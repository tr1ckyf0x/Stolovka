//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

final class ShoppingCartView: UIView {

    let shoppingCartTableView = ShoppingCartTableView()
    let shoppingCartPurchaseBlockView = ShoppingCartPurchaseBlockView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private methods
extension ShoppingCartView {
    private func setupView() {
        backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        [
            shoppingCartTableView,
            shoppingCartPurchaseBlockView
        ].forEach(addSubview(_:))

        shoppingCartPurchaseBlockView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }

        shoppingCartTableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(shoppingCartPurchaseBlockView.snp.top)
        }
    }
}
