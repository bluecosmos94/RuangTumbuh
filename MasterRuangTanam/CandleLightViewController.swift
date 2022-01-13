//
//  CandleLightViewController.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 20/11/21.
//

import UIKit

class CandleLightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkCandleLight(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CandleLight", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "check")
        self.navigationController?.show(viewController, sender: nil)
    }
    
}
