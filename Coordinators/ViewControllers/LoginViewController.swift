// Copyright © 2019 Tugboat. All rights reserved.
// Created on 28/07/19

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    weak var coordinator: LoginCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
}
