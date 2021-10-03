import UIKit
import SnapKit

class NewEvents: UIViewController {
    // MARK:- Properties
    let images: [UIImage?] = [
        .init(named: "Image1"),
        .init(named: "Image2"),
        .init(named: "Image3"),
        .init(named: "Image4"),
    ]
    
    let cellId = "NewEventsImagePicker"
    
    // MARK:- Views
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

    private lazy var eventTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor(named: "main")?.withAlphaComponent(0.3).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15
        textField.font = .systemFont(ofSize: 15)
        textField.backgroundColor = .white
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44))
        textField.leftView = spacerView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var imagesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createImagesCollectionViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImagePickerCreateCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor(named: "background")
        return collectionView
    }()
    
//    private lazy var horizontalDateStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        return stackView
//    }()
//
//    private lazy var dateButton: UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = UIColor(named: "main")?.withAlphaComponent(0.3).cgColor
//        button.layer.borderWidth = 1
//        return button
//    }()
    
    // MARK:- Lifecycle
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

    // MARK:- Views' setup
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
        
        stackView.addArrangedSubview(createSectionLabel(title: "Наименование события"))
        stackView.addArrangedSubview(eventTextField)
        
        stackView.addArrangedSubview(createSectionLabel(title: "Выберите картинку"))
        stackView.addArrangedSubview(imagesCollectionView)
        
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
        
        eventTextField.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        imagesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(62)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }

    private func createSectionLabel(title: String) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "text2")
        label.text = title
        return label
    }
    
    private func createImagesCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(62),
            heightDimension: .absolute(62))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // MARK:- Selectors
    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func savePressed() {
        self.dismiss(animated: true)
    }
}

extension NewEvents: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImagePickerCreateCollectionViewCell
        cell.isCellSelected.toggle()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImagePickerCreateCollectionViewCell
        cell.isCellSelected = false
    }
}

extension NewEvents: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImagePickerCreateCollectionViewCell
        if let image = images[indexPath.row] {
            cell.imageView.image = image
        }
        return cell
    }
}
