//
//  SearchBarCell.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 05.01.2022.
//

import UIKit
import SnapKit

class SearchBarCell: UITableViewCell {
    
    
    var item: CellItem? {
        didSet {
            guard let item = item as? SearchBarModel else { return }
            searchBar.placeholder = item.searchBarString
            let image = UIImage(sfSymbol: item.searchBarSymbol)
            searchBarButton.setBackgroundImage(image, for: .normal)
        }
    }
    
    private lazy var searchBarButton: UIButton = {
        let searchBarButton = UIButton(type: .system)
        searchBarButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        searchBarButton.tintColor = Asset.Colors.menu.color
        return searchBarButton
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.font = .systemFont(ofSize: 14, weight: .light)
        searchBar.searchTextField.textColor = Asset.Colors.secondaryText.color
        searchBar.searchTextField.textAlignment = .left
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Has Not Been Implemented.")
    }
    
    private func setupView() {
        
        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right).multipliedBy(0.85)
            make.bottom.equalTo(contentView.snp.bottom)
            make.top.equalTo(contentView.snp.top)
        }
        contentView.addSubview(searchBarButton)
        
        searchBarButton.snp.makeConstraints { make in
            make.left.equalTo(searchBar.snp.right).offset(13)
            make.width.equalTo(searchBarButton.snp.height)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    @objc func didTapSearchButton () {
        print("Tapped Search Settings Button")
    }
}
