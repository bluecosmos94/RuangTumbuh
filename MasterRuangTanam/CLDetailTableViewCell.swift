//
//  CLDetailTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 21/11/21.
//

import UIKit

class CLDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var methodeLabel: UILabel!
    @IBOutlet weak var plantLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    var garden : GardenModel = GardenModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(){
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        
        guard let areaString = formatter.string(from: NSNumber(value: garden.sizeArea/10000)) else {return}
        areaLabel.text = "\(areaString) m2"
        methodeLabel.text = garden.methode
        plantLabel.text = garden.plant
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
