//
//  Stepper.swift
//  
//
//  Created by Vladislav Lisianskii on 18.04.2022.
//

import UIKit
import SharedResources
import SnapKit

final class Stepper: UIView {

    private lazy var incrementButton: UIButton = { button in
        button.backgroundColor = Asset.Colors.stepperOperator.color
        return button
    }(UIButton())

    private lazy var decrementButton: UIButton = { button in
        button.backgroundColor = Asset.Colors.stepperOperator.color
        return button
    }(UIButton())

    private lazy var countLabelBackgroundView: UIView = { view in
        view.layer.cornerRadius = 4
        view.backgroundColor = Asset.Colors.tableViewBackground.color
        return view
    }(UIView())

    private lazy var countLabel: UILabel = { label in
        label.textColor = Asset.Colors.stepperNumber.color
        return label
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private methods
extension Stepper {
    private func setupView() {
        self.backgroundColor = Asset.Colors.stepperBackground.color
        self.layer.cornerRadius = 4

        [
            incrementButton,
            countLabelBackgroundView,
            decrementButton
        ].forEach(self.addSubview(_:))

        countLabelBackgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(countLabelBackgroundView.snp.height)
            make.centerX.centerY.equalToSuperview()
        }

        incrementButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(incrementButton.snp.height)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.right.equalTo(countLabelBackgroundView.snp.left)
        }

        decrementButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(decrementButton.snp.height)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(countLabelBackgroundView.snp.left)
        }

        countLabelBackgroundView.addSubview(countLabel)

        countLabel.snp.makeConstraints { make in
            make.centerY.centerX.height.width.equalToSuperview()
        }
    }
}
