//
//  ChecklistViewController.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 17/11/21.
//

import UIKit

class ChecklistViewController: UIViewController {
    
    @IBOutlet weak var checklistTableView: UITableView!
    
    
    var customCell = [UITableViewCell]()
    
    var gardenModel = GardenModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checklistTableView.dataSource = self
        checklistTableView.delegate = self
        checklistTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        gardenModel = UserDefaultService.shared.Last()
        
        self.title = gardenModel.name
        setupTable()
    }
    
    
    func setupTable(){
        checklistTableView.register(UINib(nibName: "CLImageTableViewCell", bundle: nil), forCellReuseIdentifier: "CLImage")
        checklistTableView.register(UINib(nibName: "CLDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CLDetail")
        checklistTableView.register(UINib(nibName: "CLToolsTableViewCell", bundle: nil), forCellReuseIdentifier: "CLTools")
        
        
        let cel1 = checklistTableView.dequeueReusableCell(withIdentifier: "CLImage") as? CLImageTableViewCell
        cel1?.gardenImg?.image = UIImage(data: gardenModel.image)
        let cel2 = checklistTableView.dequeueReusableCell(withIdentifier: "CLDetail") as? CLDetailTableViewCell
        cel2?.garden = gardenModel
        cel2?.updateUI()
        let cel3 = checklistTableView.dequeueReusableCell(withIdentifier: "CLTools") as? CLToolsTableViewCell
        
        customCell.append(cel1 ?? UITableViewCell())
        customCell.append(cel2 ?? UITableViewCell())
        customCell.append(cel3 ?? UITableViewCell())

    }
}

extension ChecklistViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cel = customCell[indexPath.row]
        
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checklistTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard customCell[indexPath.row] is CLToolsTableViewCell else {return 250}
        
        
        return CGFloat(100 * gardenModel.listTools.count)
        
    }
 
}
