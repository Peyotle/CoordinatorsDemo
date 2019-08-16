// Copyright © 2019 Tugboat. All rights reserved.
// Created on 29/07/19

import UIKit

protocol ImageSelecting {
    var imageTappedAction: ((String) -> Void)? { get set }
}

class CallbackViewController: UIViewController, Storyboarded, ImageSelecting {
    
    var imageTappedAction: ((String) -> Void)?
    
    let imageNames = [
        "sunrise",
        "cloud.sun"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func imageTapped(_ sender: UIButton) {
        let imageName = imageNames[sender.tag]
        imageTappedAction?(imageName)
    }
}
