// Copyright © 2019 Tugboat. All rights reserved.
// Created on 29/07/19

import UIKit

class CallbackCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CallbackViewController.instantiate()
        vc.imageTappedAction = {  [weak self] imageName in
            self?.showImageDetails(imageName: imageName)
        }
    }
    
    func showImageDetails(imageName: String) {
        let vc = ImageDetailsViewController.instantiate()
        vc.imageName = imageName
        navigationController.pushViewController(vc, animated: true)
    }
}
