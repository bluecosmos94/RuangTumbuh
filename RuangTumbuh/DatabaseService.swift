//
//  DatabaseService.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 19/11/21.
//

import UIKit
import Combine

class UserDefaultService : ObservableObject{
    
    static let shared : UserDefaultService = UserDefaultService()
    
    @Published var gardens : [GardenModel?] =  [GardenModel?]()
    @Published var currentGarden : GardenModel = GardenModel()
    @Published var currentPlant : PlantDetailItem = PlantDetailItem()
    @Published var currentMethode : MethodeDetailItem = MethodeDetailItem() 
    
    
    func saveToUserDefault(garden:GardenModel){
        gardens = []
        gardens.append(garden)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(gardens), forKey:"gardens")
//        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(gardens), forKey:"gardens")
        UserDefaults.standard.synchronize()
    }
    func saveNewGarden(garden:GardenModel){
        gardens.append(garden)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(gardens), forKey:"gardens")
        UserDefaults.standard.synchronize()
    }
    
    func saveToUDwithName(garden:GardenModel){
        for i in 0...gardens.count-1{
            if gardens[i]?.name == garden.name{
                gardens[i] = garden
                currentGarden = garden
                UserDefaults.standard.set(try? PropertyListEncoder().encode(gardens), forKey:"gardens")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func deleteWithThename(garden:GardenModel){
        for i in 0...gardens.count-1{
            if gardens[i]?.name == garden.name{
                gardens.remove(at: i)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(gardens), forKey:"gardens")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func isOnboarding()->Bool{
        let onboard = UserDefaults.standard.bool(forKey: "onboard")
    
        return onboard
    }
    func passOnboarding(){
        UserDefaults.standard.set(true, forKey: "onboard")
    }
    
    init() {
        readFromUserDefault()
    }
    
    func readFromUserDefault(){
        
//        UserDefaults.standard.value
        
        if let data = UserDefaults.standard.value(forKey:"gardens") as? Data {
            let gardensTry = try? PropertyListDecoder().decode(Array<GardenModel>.self, from: data)
            guard let listGarden = gardensTry else {return}
            
            self.gardens = listGarden
        }
    }
    
    func Last()->GardenModel{
        if let garden = gardens.last{
            return garden ?? GardenModel()
        }
        
        readFromUserDefault()
        return (gardens.last ?? GardenModel()) ?? GardenModel()
    }
    
    
}


struct GardenModel:Codable{
    var name:String = ""
    var sizeArea:Float = 0.0
    var location:String = ""
    var temp : Float = 0.0
    var humid : Int = 0
    var kelvin : String = ""
    var candleLight : Float = 0.0 {
        didSet{
            if candleLight < Float(candleLightNeed){
                let tool = ToolsItem(name: "LED Lamp 240 fc", num: 1, checklist: false)
                listTools.append(tool)
            }
        }
    }
    var candleLightNeed : Int = 0
    var methode : String = ""
    var plant : String = ""
    //jumlah tanaman yang tersedia
    var availNum : Int = 0 
    var isChecklistDone = false
    var image : Data = Data()
    var listTools : [ToolsItem] = [ToolsItem]()
    
}

struct ToolsItem:Codable{
    var name = ""
    var num = 0
    var checklist = false
    var tooltype = "Alat"
    var desc : String = """
"""
    var function : String = """
    """
}
