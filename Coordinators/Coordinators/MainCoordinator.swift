// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    private var loggedIn = false
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showGallery()
    }
    
    func showGallery() {
        let vc = GalleryViewController.instantiate()
        vc.colorSelectedAction = self.showColorDetails
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }
    
    typealias LogInCompletion = (Any) -> Void
    func showLogIn(completion: LogInCompletion) {
        let child = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func showColorDetails(hexRGBColor: String) {
        guard loggedIn else {
            showLogIn(completion: { _ in
                showColorDetails(hexRGBColor: hexRGBColor)
            })
            return
        }
        let vc = ColorDetailsViewController.instantiate()
        vc.hexRGBColorName = hexRGBColor
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        guard let child = child else { return }
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        let fromName = fromViewController.title ?? "Untitled"
        let toName = viewController.title ?? "Untitled"
        
        print("Navigated from: \(fromName) to: \(toName)")

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let loginViewController = fromViewController as? LoginViewController {
            // We're popping a buy view controller; end its coordinator
//            childDidFinish(loginViewController.coordinator)
        }
    }
}
