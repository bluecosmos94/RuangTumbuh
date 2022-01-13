//
//  ChosePlantViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 20/11/21.
//

import UIKit

struct PlantItem{
    var name:String = ""
    var status:String = ""
    var image:String = ""
    var light: Int = 0
    var desc : String = ""
}


class ChosePlantViewController: UIViewController {

    
    var listPlantDummy : [PlantItem] = [
        PlantItem(name: "Pok Choy", status: "35 - 45 hari", image: "pok-choy",light: 1140,desc: "Pakcoy atau bok choy (Brassica rapa Kelompok Chinensis; suku sawi-sawian atau Brassicaceae) merupakan jenis sayuran yang populer."),
        PlantItem(name: "Butterhead Lettuce", status: "30 - 45 hari", image: "butterhead"),
        PlantItem(name: "Green Lettuce", status: "30 - 45 hari", image: "green"),
        PlantItem(name: "Romane Lettuce", status: "30 - 45 hari", image: "romane"),
    ]
    
    @IBOutlet weak var plantTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MethodeTableViewCell", bundle: nil)
        plantTable.register(nib, forCellReuseIdentifier: "methodeCell")
        // Do any additional setup after loading the view.
        plantTable.delegate = self
        plantTable.dataSource = self
    }
    
}

extension ChosePlantViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return plantTable.frame.height / 8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        plantTable.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "ChosePlant", bundle: nil)
        //MeasureDone
        let viewController = storyboard.instantiateViewController(withIdentifier: "detailPlant") as! PlantDetailViewController
        viewController.plant = listPlantDummy[indexPath.row]
//        print(self.navigationController)
//        let navigationController  = UINavigationController(rootViewController: viewController)
//        self.view.window?.rootViewController = navigationController
//        self.view.window?.makeKeyAndVisible()
        self.navigationController?.show(viewController, sender: nil)
//        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "REKOMENDASI TANAMAN"
    }
    
}
extension ChosePlantViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listPlantDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = plantTable.dequeueReusableCell(withIdentifier: "methodeCell") as! MethodeTableViewCell
        
        cell.plantItem = listPlantDummy[indexPath.row]
      
        return cell
    }
    
    
    
}
