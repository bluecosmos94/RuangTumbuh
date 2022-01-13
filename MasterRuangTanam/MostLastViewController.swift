//
//  MostLastViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 15/11/21.
//

import UIKit

class MostLastViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()


        let tap = UITapGestureRecognizer(target: self, action: #selector(toMeasure))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func toMeasure(){
        let storyboard = UIStoryboard(name: "MainFeature", bundle: nil)
        //MeasureDone
        let viewController = storyboard.instantiateViewController(withIdentifier: "measure")
        let navigationController  = UINavigationController(rootViewController: viewController)
        self.view.window?.rootViewController = navigationController
        self.view.window?.makeKeyAndVisible()
    }


}
