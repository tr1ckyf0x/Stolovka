//
//  StepperConstraintStrategyFactory.swift
//  
//
//  Created by Vladislav Lisianskii on 08.05.2022.
//

import Foundation

enum StepperConstraintStrategyFactory {
    static func strategy(for style: Stepper.Style) -> StepperConstraintStrategy {
        switch style {
        case .horizontal:
            return StepperHorizontalConstraintStrategy()

        case .vertical:
            return StepperVerticalConstraintStrategy()
        }
    }
}
