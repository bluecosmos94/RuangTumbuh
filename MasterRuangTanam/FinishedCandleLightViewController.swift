//
//  FinishedCandleLightViewController.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 20/11/21.
//

import UIKit

class FinishedCandleLightViewController: UIViewController {
    
    var action : ()->() = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finished(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: true)
//        let dashboard = DashboardController(nibName: "DashboardController", bundle: nil)
////                dashboard.body = DashboardView().body
//        let navigationController  = UINavigationController(rootViewController: dashboard)
        
//        DissolveAnimation(view: view.window!)
        action()
//        view.window!.rootViewController = navigationController

    }

}
