//
//  MainScreenView.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import SnapKit

final class MainScreenView: UIView {

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.addSubview(scrollViewContentView)
        return scrollView
    }(UIScrollView())

    lazy var scrollViewContentView: UIView = { view in
        view.addSubview(stackView)
        return view
    }(UIView())

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [greetingView, searchView, productCarouselView]
        )
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    lazy var greetingView = MainScreenGreetingView()

    lazy var productCarouselView = ProductCarouselView()

    lazy var searchView = MainSearchView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MainScreenView {
    private func setupViews() {
        backgroundColor = .systemBackground
    
        addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }

        scrollViewContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }

        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
}
