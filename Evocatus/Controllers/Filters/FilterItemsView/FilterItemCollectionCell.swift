import UIKit

class FilterItemCollectionCell: UICollectionViewCell {
    static let identifier: String = "FilterItemCollectionCell"

    override var isSelected: Bool {
        set {
            filterItemView.isSelected = newValue
        }
        get {
            false
        }
    }

    private lazy var filterItemView: FilterItemView = {
        let filterItemView = FilterItemView()
        return filterItemView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
    }

    func configure(filterItem: FilterItemViewItem) {
        filterItemView.configure(filterItem: filterItem)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addSubview(filterItemView)
    }

    private func setupLayout() {
        filterItemView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    static func width(for item: FilterItemViewItem) -> CGFloat {
        return FilterItemView.width(for: item)
    }
}
