// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class ImageDetailsViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var imageName: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = self.imageName {
            if #available(iOS 13.0, *) {
                self.imageView.image = UIImage(systemName: imageName)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @IBAction func commentTapped(_ sender: Any) {
        coordinator?.comment()
    }
}
