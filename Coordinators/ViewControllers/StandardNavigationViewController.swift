// Copyright © 2019 Tugboat. All rights reserved.
// Created on 29/07/19

import UIKit

class StandardNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ImageDetailsViewController {
            viewController.imageName = "imageName"
        }
    }
}
