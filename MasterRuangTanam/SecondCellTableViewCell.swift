//
//  SecondCellTableViewCell.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 18/11/21.
//

import UIKit

class SecondCellTableViewCell: UITableViewCell {

    @IBOutlet var bigView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bigView.layer.shadowColor = UIColor.gray.cgColor
        bigView.layer.shadowOpacity = 0.2
        bigView.layer.shadowOffset = .init(width: 1.7, height: 3.0)
        bigView.layer.shadowRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addImage(_ sender: Any) {
        print("Add Images")
    }
    
    
}
