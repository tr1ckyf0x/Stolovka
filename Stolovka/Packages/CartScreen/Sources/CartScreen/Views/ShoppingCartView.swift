//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

class ShoppingCartView: UIView {

    let shoppingCartTableView = ShoppingCartTableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    private func setupView() {
        backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        addSubview(shoppingCartTableView)
        shoppingCartTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
