import UIKit
import SnapKit

class ImagePickerCreateCollectionViewCell: UICollectionViewCell {
    // MARK:- Properties
    var isCellSelected: Bool = false {
        didSet {
            updateCellState()
        }
    }
    
    // MARK:- Views
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.backgroundColor = UIColor(named: "purple")?.cgColor
//        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupImageView()
    }
    
    // MARK:- Views' setup
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK:- Private
    private func updateCellState() {
        if isCellSelected {
            imageView.layer.borderWidth = 3
        } else {
            imageView.layer.borderWidth = 0
        }
    }
}
