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
        button
    }(UIButton())

    private lazy var decrementButton: UIButton = { button in
        button
    }(UIButton())

    private lazy var countLabelBackgroundView: UIView = { view in
        view.layer.cornerRadius = 4
        return view
    }(UIView())

    private lazy var countLabel: UILabel = { label in
        label
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private methods
extension Stepper {
    private func setupView() {
    }
}
