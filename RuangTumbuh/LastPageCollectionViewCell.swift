//
//  LastPageCollectionViewCell.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 16/11/21.
//

import UIKit

class LastPageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var numbering: UIImageView!
    
    func configure(slideLabel: String, slideDesc: String, slideNum: UIImage){
        label.text = slideLabel
        desc.text = slideDesc
        numbering.image = slideNum
    }

}

