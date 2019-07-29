// Copyright © 2019 Tugboat. All rights reserved.
// Created on 29/07/19

import UIKit

class CallbackViewController: UIViewController, Storyboarded {
    
    var imageTappedAction: ((String) -> Void)?
    
    let imageNames = [
            "sunrise",
            "cloud.sun"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func imageTapped(_ sender: UIButton) {
        let imageName = imageNames[sender.tag]
        imageTappedAction?(imageName)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
