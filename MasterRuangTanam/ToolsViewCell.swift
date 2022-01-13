//
//  ToolsViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 17/11/21.
//

import UIKit

class ToolsViewCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    
    var action : (()->())!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func lookDetail(_ sender: Any) {
        print("Pencet")
        action()
    }
}
