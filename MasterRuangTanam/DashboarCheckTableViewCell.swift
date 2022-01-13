//
//  DashboarCheckTableViewCell.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 21/11/21.
//

import UIKit

class DashboarCheckTableViewCell: UITableViewCell {

    @IBOutlet weak var methodeAndPlant: UIButton!
    @IBOutlet weak var numList: UIButton!
    
    @IBOutlet weak var gardenName: UILabel!
    var progressAction : ()->() = {}
    
    var garden : GardenModel = GardenModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func updateUI(){
        // Initialization code
        garden = UserDefaultService.shared.Last()
        let checked = garden.listTools
        let donechecked = checked.filter{$0.checklist}
    
        
        gardenName.text = garden.name
        
        
        if donechecked.count == checked.count{
            numList.tintColor = UIColor(named: "myGreen")
//            numList.titleLabel?.text = "Finished!"
            numList.setTitle("Finished!", for: .normal)
        }else{
//            numList.titleLabel?.text =
            numList.setTitle("\(donechecked.count) dari \(checked.count)", for: .normal)
            numList.tintColor = .red
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func toChecklist(_ sender: Any) {
        progressAction()
    }
}
