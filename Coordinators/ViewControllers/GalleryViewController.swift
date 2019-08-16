// Copyright © 2019 Tugboat. All rights reserved.
// Created on 2/07/19

import UIKit

class GalleryViewController: UICollectionViewController, Storyboarded {
    var colorSelectedAction: ((String) -> Void)?
    let imageNames = [
        "sunrise",
        "cloud.sun"
    ]
    
    let cellColors: [UIColor] = [
        .red,
        .blue,
        .green,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBAction func imageTapped(_ sender: UIButton) {
        let imageName = imageNames[sender.tag]
        colorSelectedAction?(imageName)
    }
}
