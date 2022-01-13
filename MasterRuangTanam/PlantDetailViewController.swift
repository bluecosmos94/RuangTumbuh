//
//  PlantDetailViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 20/11/21.
//

import UIKit

class PlantDetailViewController: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantDeskripsi: UILabel!
    @IBOutlet weak var plantDuration: UILabel!
    @IBOutlet weak var plantLight: UILabel!
    
    var action : ()->() = {}
    var backAction : ()->() = {}
    
    
    var plant : PlantItem = PlantItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        titleName.text = plant.name
        plantImage.image = UIImage(named: plant.image)
        plantDuration.text = "masa tanam " + plant.status
        plantLight.text = "\(plant.light) fc"
        plant.desc.isEmpty ? (plantDeskripsi.text = "Empty") : (plantDeskripsi.text = plant.desc)
    }
    
    @IBAction func choseThePlant(_ sender: Any) {
        var garden = UserDefaultService.shared.Last()
        garden.plant = plant.name
        garden.candleLightNeed = plant.light
        
        UserDefaultService.shared.saveToUserDefault(garden: garden)
        let storyboard = UIStoryboard(name: "ChosePlant", bundle: nil)
        //MeasureDone
        let viewController = storyboard.instantiateViewController(withIdentifier: "final")
        
        self.navigationController?.show(viewController, sender: nil)
    }

}
