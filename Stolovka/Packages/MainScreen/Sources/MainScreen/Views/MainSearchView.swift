//
//  MainSearchView.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SnapKit
import SharedResources

final class MainSearchView: UIView {

    private lazy var searchBar: UISearchBar = { searchBar in
        searchBar.searchTextField.font = .systemFont(ofSize: 14, weight: .light)
        searchBar.searchTextField.textColor = SharedResources.Asset.Colors.secondaryText.color
        searchBar.searchTextField.textAlignment = .left
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = SharedResources.L10n.searchBarMessage
        return searchBar
    }(UISearchBar())

    private lazy var searchBarButton: UIButton = { button in
        button.tintColor = SharedResources.Asset.Colors.menu.color
        let image = UIImage(sfSymbol: SFSymbol.sliderHorizontal)
        button.setImage(image, for: .normal)
        return button
    }(UIButton(type: .system))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MainSearchView {
    private func setupViews() {
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
}
