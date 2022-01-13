//
//  OnboardingCollectionViewCell.swift
//  Master Ruang Tanam
//
//  Created by angga saputra on 11/11/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var slideLabel: UILabel!
    @IBOutlet var slideImage: UIImageView!
    @IBOutlet var slideDescription: UILabel!
    
    func configure(label: String, description: String, image: UIImage){
        slideLabel.text = label
        slideDescription.text = description
        slideImage.image = image
    }
}
