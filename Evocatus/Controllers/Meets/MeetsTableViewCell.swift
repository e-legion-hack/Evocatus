//
//  MeetsTableViewCell.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit

class MeetsTableViewCell: UITableViewCell {
    
    static let identifier = "MeetsTableViewCellReuseIndentifier"
    
    @IBOutlet weak var typeOfMeetLogoOutlet: UIImageView!
    @IBOutlet weak var employeeNameLabelOutlet: UILabel!
    @IBOutlet weak var locationLabelOutlet: UILabel!
    @IBOutlet weak var actionImageOutlet: UIImageView!
    
    @IBOutlet weak var backGroundCellViewOutlet: UIView!
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCellStaticApperance()
        
    }
    
    func configure(placeName: String, placeLogo: String, location: String, isMy: Bool) {
        //imageChannelsCell.image = UIImage(named: imageName ?? "logo-default")
        employeeNameLabelOutlet.text = placeName
        typeOfMeetLogoOutlet.image = UIImage(named: placeLogo)
        actionImageOutlet.image = isMy == true ? UIImage(named: "close") : UIImage(named: "check")
        locationLabelOutlet.text = location
    }
    
    func configureCellStaticApperance() {
        self.backgroundColor = .clear
        selectedBackgroundView?.backgroundColor = .gray
        typeOfMeetLogoOutlet.layer.cornerRadius = 10
        backGroundCellViewOutlet.layer.cornerRadius = 10
    }
}
