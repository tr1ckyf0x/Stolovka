//
//  StepperConstraintStrategy.swift
//  
//
//  Created by Vladislav Lisianskii on 08.05.2022.
//

import UIKit

protocol StepperConstraintStrategy {
    func setConstraints(
        stepper: UIView,
        incrementButton: UIView,
        decrementButton: UIView,
        countLabelBackgroundView: UIView,
        countLabel: UIView
    )
}
