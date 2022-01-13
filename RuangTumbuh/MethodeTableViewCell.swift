//
//  MethodeTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 17/11/21.
//

import UIKit

class MethodeTableViewCell: UITableViewCell {

    @IBOutlet weak var statusCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var imageCell: RoundImageView!
    
    var methodeItem : MethodeItem!{
        didSet{
            updateUIMethode()
        }
    }
    
    var plantItem : PlantItem!{
        didSet{
            updateUIPlant()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUIMethode(){
        statusCell.text = methodeItem.status
        
        if methodeItem.status == "Menengah"{
            statusCell.textColor = .orange
        }else if methodeItem.status == "Susah"{
            statusCell.textColor = .red
        }
        
        titleCell.text = methodeItem.title
        if !methodeItem.image.isEmpty{
            imageCell.image = UIImage(named: methodeItem.image)
        }
        let garden = UserDefaultService.shared.Last()
        
        if garden.sizeArea < methodeItem.areaNeed {
            areaLabel.isHidden = false
            self.contentView.alpha = 0.5
        }
        
    }
    
    func updateUIPlant(){
        statusCell.text = plantItem.status
        titleCell.text = plantItem.name
        if !plantItem.image.isEmpty{
            imageCell.image = UIImage(named: plantItem.image)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
