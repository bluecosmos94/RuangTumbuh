//
//  FinishedPlantViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 20/11/21.
//

import UIKit

class FinishedPlantViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finished(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "dashboard")
        let navigationController  = UINavigationController(rootViewController: viewController)
        
        self.view.window?.rootViewController = navigationController
        self.view.window?.makeKeyAndVisible()
    }
    
}
