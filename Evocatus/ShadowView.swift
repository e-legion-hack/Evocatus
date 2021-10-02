//
//  ShadowView.swift
//  Evocatus
//
//  Created by KONSTANTIN TISHCHENKO on 02.10.2021.
//
import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        
        
        func setLayout(){
            layer.cornerRadius = 35
            layer.shadowColor = CGColor(srgbRed: 180/255, green: 156/255, blue: 246/255, alpha: 1)
            layer.shadowRadius = 8
            layer.shadowOffset = .zero
            layer.shadowOpacity = 1
        }
    }
}
