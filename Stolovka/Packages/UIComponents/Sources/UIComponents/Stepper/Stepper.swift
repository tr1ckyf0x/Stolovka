//
//  Stepper.swift
//  
//
//  Created by Vladislav Lisianskii on 18.04.2022.
//

import UIKit
import SharedResources

public protocol StepperDelegate: AnyObject {
    func stepperDidPressIncrement(
        _ stepper: Stepper
    )

    func stepperDidPressDecrement(
        _ stepper: Stepper
    )
}

public final class Stepper: UIView {

    public var value: Int = 0 {
        didSet {
            self.countLabel.text = String(value)
        }
    }

    public weak var delegate: StepperDelegate?

    public private(set) var style: Style

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

        countLabelBackgroundView.addSubview(countLabel)

        let constraintStrategy = StepperConstraintStrategyFactory.strategy(for: style)

        constraintStrategy.setConstraints(
            stepper: self,
            incrementButton: incrementButton,
            decrementButton: decrementButton,
            countLabelBackgroundView: countLabelBackgroundView,
            countLabel: countLabel
        )
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
