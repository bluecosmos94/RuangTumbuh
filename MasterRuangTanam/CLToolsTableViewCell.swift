//
//  CLToolsTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 21/11/21.
//

import UIKit

class CLToolsTableViewCell: UITableViewCell, UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var tableView: UITableView!
    
    var tools : [ToolsItem] = [
        ToolsItem(name: "Hidroponik Rak KIT Gully Trapesium NFT 1 Meter (4 Gully)", num: 2),
        ToolsItem(name: "Container", num: 4),
        ToolsItem(name: "Suntikan 10 mL", num: 1),
        ToolsItem(name: "Netpot", num: 40),
        ToolsItem(name: "TDS Meter", num: 1),
        ToolsItem(name: "PH Meter", num: 1),
        ToolsItem(name: "LED Lamp 240 fc", num: 1),
        ToolsItem(name: "Benih PokChoy", num: 80),
        ToolsItem(name: "Rockwool", num: 1),
        ToolsItem(name: "Nutrisi AB Mix", num: 1),
    ]
    
    var garden = GardenModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChecklistTableViewCell", bundle: nil), forCellReuseIdentifier: "checklist")
        
        garden = UserDefaultService.shared.Last()
        
        tools = garden.listTools
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklist", for: indexPath) as! ChecklistTableViewCell
        cell.tool = tools[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(tools.count)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tools[indexPath.row].checklist.toggle()
        garden.listTools = tools
        UserDefaultService.shared.saveToUserDefault(garden: garden)
        tableView.reloadData()
    }
}



