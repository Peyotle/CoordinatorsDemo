// Copyright © 2019 Tugboat. All rights reserved.
// Created on 28/07/19

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
               vc.coordinator = self
               navigationController.pushViewController(vc, animated: true)
    }
}
