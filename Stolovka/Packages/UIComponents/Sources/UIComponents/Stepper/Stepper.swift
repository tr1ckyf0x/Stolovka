//
//  Stepper.swift
//  
//
//  Created by Vladislav Lisianskii on 18.04.2022.
//

import UIKit
import SharedResources
import SnapKit

public final class Stepper: UIView {

    private (set) var stepperType: StepperType

    private lazy var incrementButton: UIButton = { button in
        let image = UIImage(sfSymbol: SFSymbol.plus)
        button.setImage(image, for: .normal)
        button.tintColor = Asset.Colors.stepperOperator.color
        return button
    }(UIButton())

    private lazy var decrementButton: UIButton = { button in
        button.backgroundColor = Asset.Colors.stepperBackground.color
        let image = UIImage(sfSymbol: SFSymbol.minus)
        button.setImage(image, for: .normal)
        button.tintColor = Asset.Colors.stepperOperator.color
        return button
    }(UIButton())

    private lazy var countLabelBackgroundView: UIView = { view in
        view.layer.cornerRadius = 4
        view.backgroundColor = Asset.Colors.tableViewBackground.color
        view.layer.borderColor = Asset.Colors.stepperNumber.color.cgColor
        view.layer.borderWidth = 1
        return view
    }(UIView())

    private lazy var countLabel: UILabel = { label in
        label.textColor = Asset.Colors.stepperNumber.color
        label.text = "12"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }(UILabel())

    public init(stepperType: StepperType) {
        self.stepperType = stepperType
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
// MARK: - Public Methods

extension Stepper {

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

        switch stepperType {
        case .horizontal:
            setupHorizontalStepperConstraints()

        case .vertical:
            setupVerticalStepperConstraints()
        }
    }

    private func setupHorizontalStepperConstraints() {
        countLabelBackgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(countLabelBackgroundView.snp.height)
        }

        countLabelBackgroundView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.top.bottom.width.height.left.right.equalTo(countLabelBackgroundView)
        }

        decrementButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(4)
            make.right.equalTo(countLabelBackgroundView.snp.left)
            make.height.equalToSuperview().multipliedBy(0.96)
        }

        incrementButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(4)
            make.left.equalTo(countLabelBackgroundView.snp.right)
            make.height.equalToSuperview().multipliedBy(0.96)
        }
    }

    private func setupVerticalStepperConstraints() {

        countLabelBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(countLabelBackgroundView.snp.width)
        }

        countLabelBackgroundView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.top.bottom.width.height.left.right.equalTo(countLabelBackgroundView).inset(4)
        }

        incrementButton.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(4)
            make.bottom.equalTo(countLabelBackgroundView.snp.top)
        }

        decrementButton.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(4)
            make.top.equalTo(countLabelBackgroundView.snp.bottom)
        }
    }
}

extension Stepper {
    public enum StepperType {
        case vertical
        case horizontal
    }
}
