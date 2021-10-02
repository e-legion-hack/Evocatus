//
//  MeetsTableViewCell.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit

class MeetsTableViewCell: UITableViewCell {
    
    static let identifier = "MeetsTableViewCellReuseIndentifier"
    
    @IBOutlet var placeNameLabelOutlet: UILabel!
    @IBOutlet var logoImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCellStaticApperance()
        
    }
    
    func configure(placeName: String?, placeLogo: String) {
        //imageChannelsCell.image = UIImage(named: imageName ?? "logo-default")
        placeNameLabelOutlet.text = placeName
        logoImage.image = UIImage(named: placeLogo)
    }
    
    func configureCellStaticApperance() {
        self.backgroundColor = .clear
        selectedBackgroundView?.backgroundColor = .gray
        logoImage.layer.cornerRadius = 4
    }
}
