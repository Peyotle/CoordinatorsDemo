// Copyright © 2019 Tugboat. All rights reserved.
// Created on 29/07/19

import UIKit

class StandardNavigationViewController: UIViewController {

    let imageNames = [
        "sunrise",
        "cloud.sun"
    ]
    
    func didSelectItem(withIndex index: Int) {
        let imageName = imageNames[index]
        let imageDetailsViewController = ImageDetailsViewController.instantiate()
        imageDetailsViewController.imageName = imageName
        
        self.navigationController?.pushViewController(imageDetailsViewController, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let viewController = segue.destination as? CallbackViewController {
            viewController.imageTappedAction = { [weak self] imageName in
                // Do your stuff with the image selected in the child view controller
            }
        }
    }
}
