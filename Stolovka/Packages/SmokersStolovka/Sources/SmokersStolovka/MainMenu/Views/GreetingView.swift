//
//  GreetingCell.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 31.12.2021.

import UIKit
import SnapKit
import SharedResources

class GreetingView: UIView {

    private lazy var usernameGreetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 1
        label.text = SharedResources.L10n.guest
        return label
    }()

    private lazy var qouteOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = usernameGreetingLabel.font
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameGreetingLabel, qouteOfTheDayLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(username: String, qouteOfDay: String) {
        usernameGreetingLabel.text = SharedResources.L10n.standardGreeting(username)
        qouteOfTheDayLabel.text = qouteOfDay
    }

    private func setupView() {

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}

extension GreetingView {

    var greetingText: String? {
        get {
            usernameGreetingLabel.text
        }
        set {
            usernameGreetingLabel.text = newValue
        }
    }

    var quoteOfTheDayText: String? {
        get {
            qouteOfTheDayLabel.text
        }
        set {
            qouteOfTheDayLabel.text = newValue
        }
    }
}
