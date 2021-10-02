//
//  TabBarController.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        tabBar.backgroundColor = .white
    }
}
