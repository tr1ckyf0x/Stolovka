//
//  StepperVerticalConstraintStrategy.swift
//  
//
//  Created by Vladislav Lisianskii on 08.05.2022.
//

import UIKit
import SnapKit

struct StepperVerticalConstraintStrategy: StepperConstraintStrategy {
    func setConstraints(
        stepper: UIView,
        incrementButton: UIView,
        decrementButton: UIView,
        countLabelBackgroundView: UIView,
        countLabel: UIView
    ) {
        countLabelBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(countLabelBackgroundView.snp.width)
        }

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
