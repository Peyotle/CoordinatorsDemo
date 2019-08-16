//
//  ColorDetailsViewController.swift
//  Coordinators
//
//  Created by Oleg Chernyshenko on 16/8/19.
//  Copyright © 2019 Tugboat. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController, Storyboarded {
    var hexRGBColorName = "#ffffff"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = hexRGBColorName
        self.view.backgroundColor = UIColor.init(hexRGBString: hexRGBColorName)
    }
}
