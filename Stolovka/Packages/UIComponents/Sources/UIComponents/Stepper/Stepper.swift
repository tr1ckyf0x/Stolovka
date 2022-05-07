//
//  Stepper.swift
//  
//
//  Created by Vladislav Lisianskii on 18.04.2022.
//

import UIKit
import SharedResources
import SnapKit

public protocol StepperDelegate: AnyObject {
    func stepperDidPressIncrement(
        _ stepper: Stepper
    )

    func stepperDidPressDecrement(
        _ stepper: Stepper
    )
}

public final class Stepper: UIView {

    private (set) var style: Style

    public var value: Int = 0 {
        didSet {
            self.countLabel.text = String(value)
        }
    }

    public weak var delegate: StepperDelegate?

    private lazy var incrementButton: UIButton = { button in
        let image = UIImage(sfSymbol: SFSymbol.plus)
        button.setImage(image, for: .normal)
        button.tintColor = Asset.Colors.stepperOperator.color
        button.addTarget(self, action: #selector(addOneItem), for: .touchDown)
        return button
    }(UIButton(type: .system))

    private lazy var decrementButton: UIButton = { button in
        button.backgroundColor = Asset.Colors.stepperBackground.color
        let image = UIImage(sfSymbol: SFSymbol.minus)
        button.setImage(image, for: .normal)
        button.tintColor = Asset.Colors.stepperOperator.color
        button.addTarget(self, action: #selector(removeOneItem), for: .touchDown)
        return button
    }(UIButton(type: .system))

    private lazy var countLabelBackgroundView: UIView = { view in
        view.layer.cornerRadius = 4
        view.backgroundColor = Asset.Colors.tableViewBackground.color
        view.layer.borderColor = Asset.Colors.stepperNumber.color.cgColor
        view.layer.borderWidth = 1
        return view
    }(UIView())

    private lazy var countLabel: UILabel = { label in
        label.textColor = Asset.Colors.stepperNumber.color
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }(UILabel())

    public init(style: Style) {
        self.style = style
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

        switch style {
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

    @objc
   private func addOneItem() {
        delegate?.stepperDidPressIncrement(self)
    }

    @objc
   private func removeOneItem() {
        delegate?.stepperDidPressDecrement(self)
    }
}

extension Stepper {
    public enum Style {
        case vertical
        case horizontal
    }
}
