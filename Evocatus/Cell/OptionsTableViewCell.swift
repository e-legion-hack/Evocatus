//
//  OptionsTableViewCell.swift
//  Evocatus
//
//  Created by KONSTANTIN TISHCHENKO on 02.10.2021.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    let backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addImageContact: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.isHidden = true
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        setOptionsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cellConfigure(nameArray: [[String]], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section][indexPath.row]
        indexPath.section == 2 ? (addImageContact.isHidden = false) : (addImageContact.isHidden = true)
    }
    
    //MARK: - SetOptionsConstraints
    
    func setOptionsConstraints() {
        
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
        
        self.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 15)
        ])
        
        self.contentView.addSubview(addImageContact)
        NSLayoutConstraint.activate([
            addImageContact.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor, constant: 0),
            addImageContact.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 0),
            addImageContact.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor, constant: 0),
            addImageContact.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor, constant: 0)
        ])
    }
}


