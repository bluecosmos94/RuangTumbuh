//
//  MethodeDoneViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 19/11/21.
//

import UIKit

class MethodeDoneViewController: UIViewController {

    @IBOutlet weak var img: GifImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let garden = UserDefaultService.shared.Last()
//        
//        img.image = UIImage(data: garden.image)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "dashboard")
        let navigationController  = UINavigationController(rootViewController: viewController)
        
        self.view.window?.rootViewController = navigationController
        self.view.window?.makeKeyAndVisible()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
