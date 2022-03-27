//
//  SearchBarCell.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 05.01.2022.
//

import UIKit
import SnapKit
import SharedResources

class SearchBarView: UIView {

    private lazy var searchBarButton: UIButton = {
        let searchBarButton = UIButton(type: .system)
        searchBarButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        searchBarButton.tintColor = SharedResources.Asset.Colors.menu.color
        searchBarButton.setBackgroundImage(UIImage(sfSymbol: SFSymbol.sliderHorizontal), for: .normal)
        return searchBarButton
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.font = .systemFont(ofSize: 14, weight: .light)
        searchBar.searchTextField.textColor = SharedResources.Asset.Colors.secondaryText.color
        searchBar.searchTextField.textAlignment = .left
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = SharedResources.L10n.searchBarMessage
        return searchBar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Has Not Been Implemented.")
    }

    private func setupView() {

        [
            searchBar,
            searchBarButton
        ].forEach(addSubview(_:))

        searchBar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(searchBarButton.snp.leading).offset(-8)
        }

        searchBarButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.top.greaterThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }

    }

    @objc
    func didTapSearchButton () {
        print("Tapped Search Settings Button")
    }

}
