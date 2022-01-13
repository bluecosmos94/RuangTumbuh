//
//  ChoseMethodeViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 17/11/21.
//

import UIKit

class ChoseMethodeViewController: UIViewController {

    @IBOutlet weak var methodeTable: UITableView!
    
    var listMethodeDummy : [MethodeItem] = [
        MethodeItem(title: "NFT Hidroponik", status: "Mudah", image: "methods-nft-listview",areaNeed: 10000),
        MethodeItem(title: "Wick Hidroponik", status: "Mudah", image: "",areaNeed: 5000),
        MethodeItem(title: "POT", status: "Mudah", image: "",areaNeed: 4000),
        MethodeItem(title: "EBB & Flow", status: "Menengah", image: "",areaNeed: 20000),
        MethodeItem(title: "Drip System", status: "Menengah", image: "",areaNeed: 20000),
        MethodeItem(title: "Aeroponik", status: "Susah", image: "",areaNeed: 20000),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        let nib = UINib(nibName: "MethodeTableViewCell", bundle: nil)
        methodeTable.register(nib, forCellReuseIdentifier: "methodeCell")
        
        methodeTable.delegate = self
        methodeTable.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension ChoseMethodeViewController :
    UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "REKOMENDASI METODE"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listMethodeDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = methodeTable.dequeueReusableCell(withIdentifier: "methodeCell") as! MethodeTableViewCell
        
        cell.methodeItem = listMethodeDummy[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//        cell.updateUI()
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return methodeTable.frame.height / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        methodeTable.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            let storyboard = UIStoryboard(name: "ChooseMethode", bundle: nil)
            //MeasureDone
            let viewController = storyboard.instantiateViewController(withIdentifier: "methodeDetail")
            self.navigationController?.show(viewController, sender: nil)
//            self.present(viewController, animated: true, completion: nil)
        }
    }
}


struct MethodeItem{
    var title:String!
    var status:String!
    var image:String!
    var areaNeed : Float = 0.0
    
}
