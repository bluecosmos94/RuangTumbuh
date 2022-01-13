//
//  ChecklistTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 17/11/21.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var alatLabel: UILabel!
    @IBOutlet weak var jumlahLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIImageView!
    
    var tool : ToolsItem = ToolsItem() {
        didSet{
            alatLabel.text = tool.name
            jumlahLabel.text = "\(tool.num) buah"
            var image = UIImage(systemName: "checkmark.square")
            if tool.checklist{
                image = UIImage(systemName: "checkmark.square.fill")
            }
            checkboxButton.image = image
            
            checkboxButton.layer.cornerRadius = 8
//            checkboxButton.imageView?.image = tool.checklist ? UIImage(contentsOfFile: "checkmark.square.fill") : UIImage(contentsOfFile:"checkmark.square")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
