//  Created by Nikita Shvad on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit
import SharedResources

class ShoppingCartView: UIView {

    let shoppingCartTableView = ShoppingCartTableView()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollViewContentView)
        return scrollView
    }()

    private lazy var scrollViewContentView: UIView = {
        let view = UIView()
        view.addSubview(stackView)
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shoppingCartTableView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    private func setupView() {
        backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }

        scrollViewContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }

        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

    }
}
