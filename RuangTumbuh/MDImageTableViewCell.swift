//
//  MDImageTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 23/11/21.
//

import UIKit

class MDImageTableViewCell: UITableViewCell {


    @IBOutlet weak var mdTitle: UILabel!
    @IBOutlet weak var mdImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
