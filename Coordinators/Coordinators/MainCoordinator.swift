// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    private var loggedIn = false
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showImageDetails(imageName: String) {
        let vc = ImageDetailsViewController.instantiate()
        vc.coordinator = self
        vc.imageName = imageName
        navigationController.pushViewController(vc, animated: true)
    }
    
    func comment() {
        guard loggedIn else {
            logIn()
            return
        }
        let vc = CommentViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func logIn() {
       
    }
}
