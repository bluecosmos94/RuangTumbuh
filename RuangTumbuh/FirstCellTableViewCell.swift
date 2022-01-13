//
//  FirstCellTableViewCell.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 18/11/21.
//

import UIKit

enum PlanStep{
    case first
    case second
    case third
    case fourth
    case fifth
}

class FirstCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gardenName: UILabel!
    
    @IBOutlet var bigView: UIView!
  
    @IBOutlet var secondState: UIImageView!
    
    @IBOutlet var thirdState: UIImageView!
    
    @IBOutlet var fourthState: UIImageView!
    
    @IBOutlet var fifthState: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var progress : PlanStep = .first
    
    var progressAction : ()->() = {}
    var vc : UIViewController = UIViewController()
    
    var garden = GardenModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bigView.layer.shadowColor = UIColor.gray.cgColor
        bigView.layer.shadowOpacity = 0.2
        bigView.layer.shadowOffset = .init(width: 1.7, height: 3.0)
        bigView.layer.shadowRadius = 3
     
        garden = UserDefaultService.shared.Last()
        gardenName.text = garden.name
        
        locationLabel.attributedText = NSAttributedString(string: garden.location)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "thermometer")
        let imageAttachment2 = NSTextAttachment()
        imageAttachment2.image = UIImage(systemName: "barometer")
        let fullString = NSMutableAttributedString(attachment: imageAttachment)
        fullString.append(NSAttributedString(string: " \(garden.temp)º "))
        fullString.append(NSAttributedString(attachment: imageAttachment2))
        fullString.append(NSAttributedString(string: " \(garden.humid)%"))
        
        weatherLabel.attributedText = fullString
        
        
        if !garden.methode.isEmpty{
            fourthState.image = UIImage(named: "checklist-icon")
//            progress = .second
        }
        
        if !garden.plant.isEmpty{
            thirdState.image = UIImage(named: "checklist-icon")
//            progress = .third
        }
        
        if !(garden.candleLight==0){
            secondState.image = UIImage(named: "checklist-icon")
//            progress = .fourth
        }
        
        if garden.isChecklistDone{
            fifthState.image = UIImage(named: "checklist-icon")
//            progress = .fifth
        }
        cekProgress()
    }
    
    func cekProgress(){
        if garden.plant.isEmpty{
            progress = .second
            
        }else if garden.methode.isEmpty{
            progress = .third
        }else if garden.candleLight == 0{
            progress = .fourth
        }
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seeAll(_ sender: Any) {
        print("see all")
    }
    
    @IBAction func tesPrint(_ sender: Any) {
        switch progress {
        case .first:
            print("first")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            vc = storyboard.instantiateViewController(withIdentifier: "MostLastViewController")
            
            progressAction()
        case .second:
            print("second")
            let storyboard = UIStoryboard(name: "ChosePlant", bundle: nil)
            
            vc = storyboard.instantiateViewController(withIdentifier: "chosePlant")
            
            
            progressAction()
        case .third:
            print("third")
            let storyboard = UIStoryboard(name: "ChooseMethode", bundle: nil)
            
            vc = storyboard.instantiateViewController(withIdentifier: "methode")
            
            progressAction()
        case .fourth:
            print("fourth")
        case .fifth:
            print("fifth")
        }
    }
    
}
