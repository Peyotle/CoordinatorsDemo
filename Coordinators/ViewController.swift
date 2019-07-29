// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    let imageNames = [
        "sunrise",
        "cloud.sun"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func imageTapped(_ sender: UIButton) {
        let imageName = imageNames[sender.tag]
        coordinator?.showImageDetails(imageName: imageName)
    }
}
