// Copyright © 2019 Tugboat. All rights reserved.
// Created on 28/07/19

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    var loginPressedAction: (() -> Void)?
    var forgotPasswordAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logInPressed(_ sender: UIButton) {
        loginPressedAction?()
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        forgotPasswordAction?()
    }
}
