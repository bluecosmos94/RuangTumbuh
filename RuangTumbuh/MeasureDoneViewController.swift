//
//  MeasureDoneViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 16/11/21.
//

import UIKit
import SwiftUI

class MeasureDoneViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    var action:()->()={}
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gif = UIImage.gifImageWithName("growing-plant")
//        gifImage.image = gif
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @IBAction func DoneMeasuring(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "CandleLight", bundle: nil)
//        //MeasureDone
//        let viewController = storyboard.instantiateViewController(withIdentifier: "candleIntro")
//        self.show(viewController, sender: nil)
        
//        let vc = TutorialPageView(title: "Pengukuran Cahaya",width:200,tutorial: "Yuk Cek Cahaya di Kebunmu",desc: "Cek saat cuaca terik (siang hari) untuk hasil optimal ya.")
//            .environmentObject(AppData(window: view.window, navigation: self.navigationController))
//            .environmentObject(UserDefaultService.shared)
//        
//        let hostingViewController = UIHostingController(rootView: vc)
//        self.navigationController?.show(hostingViewController, sender: nil)
        action()
        
    }
    
}
