// Copyright © 2019 Tugboat. All rights reserved.
// Created on 28/07/19

import UIKit

class LoginCoordinator: Coordinator {
    var completedAction: (() -> Void)?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    var modalNavigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLogIn()
    }
    
    func showLogIn() {
        let vc = LoginViewController.instantiate()
        vc.loginPressedAction = { [weak self] in
            self?.modalNavigationController?.dismiss(animated: true) {
                self?.completedAction?()
            }
        }
        vc.forgotPasswordAction = forgotPassword
        modalNavigationController = UINavigationController(rootViewController: vc)
//        if #available(iOS 13.0, *) {
//            modalNavigationController?.modalPresentationStyle = .automatic
//        } else {
            modalNavigationController?.modalPresentationStyle = .fullScreen
//        }
        navigationController.topViewController?.present(modalNavigationController!,
                                                        animated: true)
    }

    func forgotPassword() {
        let vc = ForgotPasswordViewController.instantiate()
        modalNavigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginCoordinator {
    func navigateTo(path: String) -> Coordinator? {
        return nil
    }
}
