import UIKit
import SnapKit

struct StepperHorizontalConstraintStrategy: StepperConstraintStrategy {
    func setConstraints(
        stepper: UIView,
        incrementButton: UIView,
        decrementButton: UIView,
        countLabelBackgroundView: UIView,
        countLabel: UIView
    ) {
        countLabelBackgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(countLabelBackgroundView.snp.height)
        }

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
}
