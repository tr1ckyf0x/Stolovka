import UIKit
import SharedResources

final class StolovkaMainScreenView: UIView {

    let greetingSubview = GreetingView()
    let searchSubview = SearchBarView()
    let recommendationsSubview = RecommendationsCollectionView()
    let itemCategoryCollectionView = ItemCategoryCollectionView()
    let categorizedFoodItemsSubview = CategorizedFoodItemsCollectionView()
    let emptyView = UIView()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollViewContentView)
        return scrollView
    }()

    private lazy var scrollViewContentView: UIView = {
        let view = UIView()
        view.addSubview(stackView)
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingSubview, searchSubview, recommendationsSubview, emptyView, itemCategoryCollectionView, categorizedFoodItemsSubview])
        stackView.axis = .vertical
        stackView.setCustomSpacing(24, after: searchSubview)
        stackView.spacing = 16
        stackView.backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }

    required init?(coder: NSCoder) {
        fatalError("Was Not Implemented.")
    }
}

// MARK: - Private Methods
extension StolovkaMainScreenView {
    private func setupview() {
        backgroundColor = SharedResources.Asset.Colors.tableViewBackground.color
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

        emptyView.snp.makeConstraints { make in
            make.height.equalTo(searchSubview.snp.height).multipliedBy(0.3)
        }
    }
}
