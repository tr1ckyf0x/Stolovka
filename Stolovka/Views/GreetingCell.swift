//
//  GreetingCell.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 31.12.2021.
//Вообще все настройки цвета нужно вывести в K

import UIKit
import SnapKit

class GreetingCell: UITableViewCell {

    var item: CellItem? {
        didSet {
            guard let item = item as? GreetingModel else { return }
            usernameGreetingLabel.text = item.usernameGreeting
            qouteOfTheDayLabel.text = item.qouteOfTheDay
        }
    }
    
    private lazy var usernameGreetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var qouteOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryText.color
        label.font = usernameGreetingLabel.font
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(stackView)
        stackView.addSubview(usernameGreetingLabel)
        stackView.addSubview(qouteOfTheDayLabel)
        
        stackView.frame = contentView.bounds
        
        usernameGreetingLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp_topMargin)
            make.left.equalTo(stackView.snp.left).offset(8)
            make.right.equalTo(stackView.snp.right).offset(8)
        }
        
        qouteOfTheDayLabel.snp.makeConstraints { make in
            make.height.equalTo(usernameGreetingLabel.snp.height)
            make.top.equalTo(usernameGreetingLabel.snp.bottom).offset(8)
            make.left.equalTo(stackView.snp.left).offset(8)
            make.right.equalTo(stackView.snp.right).offset(8)
            make.bottom.equalTo(stackView.snp.bottom)
        }
        
        
    }
}
