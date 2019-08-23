// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class GalleryViewController: UICollectionViewController, Storyboarded {
    var colorSelectedAction: ((String) -> Void)?
    var forgotPasswordAction: ((String) -> Void)?
    
    let cellColors: [UIColor] = [
        .red,
        .blue,
        .green,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forgotItem = UIBarButtonItem(barButtonSystemItem: .fastForward,
        target: self,
        action: #selector(self.forgotPassword))
        
        self.navigationItem.setRightBarButton(forgotItem, animated: false)
    }

    // MARK: Path demonstration
    @objc func forgotPassword() {
        forgotPasswordAction?("login/forgot")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellColors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        cell.backgroundColor = cellColors[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colorName = cellColors[indexPath.item].htmlRGBColor
        colorSelectedAction?(colorName)
    }
}
