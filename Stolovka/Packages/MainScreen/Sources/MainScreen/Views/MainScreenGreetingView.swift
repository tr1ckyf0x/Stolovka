//
//  MainScreenGreetingView.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SnapKit
import SharedResources

final class MainScreenGreetingView: UIView {

    private lazy var greetingLabel: UILabel = { label in
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }(UILabel())

    private lazy var quoteOfTheDayLabel: UILabel = { label in
        label.textColor = SharedResources.Asset.Colors.primaryText.color
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension MainScreenGreetingView {
    var greetingText: String? {
        get {
            greetingLabel.text
        }
        set {
            greetingLabel.text = newValue
        }
    }

    var quoteOfTheDayText: String? {
        get {
            quoteOfTheDayLabel.text
        }
        set {
            quoteOfTheDayLabel.text = newValue
        }
    }
}

// MARK: - Private methods
extension MainScreenGreetingView {
    private func setupViews() {
        [
            greetingLabel,
            quoteOfTheDayLabel
        ].forEach(addSubview(_:))

        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }

        quoteOfTheDayLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}
