import UIKit
import SnapKit

class NewEvents: UIViewController {
    private lazy var titleBackgroundView: UIView = {
        let titleBackgroundView = UIView()
        return titleBackgroundView
    }()

    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidPress), for: .touchUpInside)
        return closeButton
    }()

    private lazy var saveButton: UIButton = {
        let button = PrimaryButton.make()
        button.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()

    private lazy var scrollView: UIScrollView = {
        return .init()
    }()

    private lazy var categoryItemsView: FIlterItemsView = {
        let fIlterItemsView = FIlterItemsView()
        fIlterItemsView.configure(items: [
            FilterItem(kind: .lunch),
            FilterItem(kind: .sport),
            FilterItem(kind: .party),
            FilterItem(kind: .boardGames),
            FilterItem(kind: .nature)
        ])
        fIlterItemsView.selectItemHandler = { item in
            if let filterItem = item as? FilterItem {
                print(filterItem.kind)
            }
        }
        return fIlterItemsView
    }()

    required init(){
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Новое событие"
        setupView()
        setupLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        categoryItemsView.snp.remakeConstraints { make in
            make.height.equalTo(categoryItemsView.intrinsicContentSize.height)
        }
    }

    @objc private func savePressed() {
        self.dismiss(animated: true)
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
        titleBackgroundView.backgroundColor = .white

        view.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(closeButton)
        titleBackgroundView.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(createSectionLabel(title: "Выберите категорию"))
        stackView.addArrangedSubview(categoryItemsView)

        view.addSubview(saveButton)
    }

    private func setupLayout() {
        titleBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(50)
        }

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        closeButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(4)
            make.size.equalTo(44)
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleBackgroundView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
            make.width.equalTo(view)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.leading.trailing.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(16)
        }

        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }

    private func createSectionLabel(title: String) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "text2")
        label.text = title
        return label
    }

    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
    }
}
