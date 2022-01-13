//
//  GardenNamingViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 16/11/21.
//

import UIKit

class GardenNamingViewController: UIViewController {

    @IBOutlet weak var gardenName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func finishedNaming(_ sender: Any) {
        
        guard let name = gardenName.text else {return}
        
        
        var garden = UserDefaultService.shared.Last()
        
        garden.name = name
        
        UserDefaultService.shared.saveToUserDefault(garden: garden)
        
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        //MeasureDone
        let viewController = storyboard.instantiateViewController(withIdentifier: "dashboard")
        let navigationController  = UINavigationController(rootViewController: viewController)

        self.view.window?.rootViewController = navigationController
        self.view.window?.makeKeyAndVisible()
        
    }
    
}
