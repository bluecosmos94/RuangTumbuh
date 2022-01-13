//
//  MDStatusTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 23/11/21.
//

import UIKit

class MDStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var mdTitle: UILabel!
    var methode : MethodeDetailItem = MethodeDetailItem()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateUI(){
        mdTitle.text = methode.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
