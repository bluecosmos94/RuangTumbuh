//
//  DashboardViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 16/11/21.
//

import UIKit
import RealityKit
import ARKit


class DashboardViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var garden = GardenModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UINib(nibName: "FirstCellTableViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
        self.tableView.register(UINib(nibName: "SecondCellTableViewCell", bundle: nil), forCellReuseIdentifier: "secondCell")
        self.tableView.register(UINib(nibName: "ThirdCellTableViewCell", bundle: nil), forCellReuseIdentifier: "thirdCell")
        self.tableView.register(UINib(nibName: "DashboarCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "DCCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
//        garden = UserDefaultService.shared.Last()
//        UserDefaultService.shared.saveToUserDefault(garden: garden)
        self.tableView.reloadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("IAM BACK")
        navigationController?.navigationBar.isHidden = true
       
    }
    
    @IBAction func addLocation(_ sender: Any) {
        print("Add location")
    }
    

}


extension DashboardViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            
            garden = UserDefaultService.shared.Last()
            if garden.candleLight==0||garden.plant.isEmpty||garden.methode.isEmpty||garden.sizeArea==0.0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstCellTableViewCell
                cell.selectionStyle = UITableViewCell.SelectionStyle .none
                cell.progressAction = {
                    
                    self.navigationController?.show(cell.vc, sender: nil)
                    self.navigationController?.navigationBar.isHidden = false
                    
                }
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DCCell", for: indexPath) as! DashboarCheckTableViewCell
                cell.selectionStyle = UITableViewCell.SelectionStyle .none
                cell.updateUI()
//                let checked = garden.listTools
//                let donechecked = checked.filter{$0.checklist}
//                
//                cell.numList.titleLabel?.text = "\(donechecked.count) dari \(checked.count)"
                cell.progressAction = {
                    let storyboard = UIStoryboard(name: "PerencanaanKebun", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "checklist")
                    // TODO : GO TO CHECKLIST VIEW CONTROLLER
                    self.navigationController?.show(vc, sender: nil)
                    if self.navigationController == nil{
                        self.present(vc, animated: true) {

                        }
                    }
                }
                return cell
            }
            
            
        } else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle .none
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle .none
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Calon Kebunku" : section == 1 ?  "Browse" : "Galeri Kebun"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 500
        }else if(indexPath.section == 1) {
            return 300.0
        }else{
            return 230
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            headerView.backgroundColor = .white
            
            let label = UILabel()
            
            label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Calon Kebunku"
            label.font = .systemFont(ofSize: 18)
            label.font = label.font.bold()
            label.textColor = .gray
                  
            headerView.addSubview(label)
                   
            return headerView
            
        }else if (section == 1) {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .white
            
            let label = UILabel()
            
            label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Browse"
            label.font = .systemFont(ofSize: 18)
            label.font = label.font.bold()
            
            label.textColor = .systemGray

            headerView.addSubview(label)
            
            return headerView
        } else if (section == 2){
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .white
            
            let label = UILabel()
            
            
            label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Gallery Kebun"
            label.font = .systemFont(ofSize: 16)
            label.textColor = .systemGray
            
            
            headerView.addSubview(label)
            
            return headerView
           
        }else {
            return UIView()
        }
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    
}
