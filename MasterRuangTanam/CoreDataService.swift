//
//  CoreDataService.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 25/11/21.
//

import Foundation
import CoreData
import Combine


class CoreDataService: ObservableObject{
    let manager = CoreDataManager.shared
    let context: NSManagedObjectContext!
    
    init(){self.context = manager.context}
    
    // MARK: GardenEntity
    func fetchGardens() -> [GardenEntity]{
        do{
            return try context.fetch(NSFetchRequest<GardenEntity>(entityName: "GardenEntity"))
        }
        catch let error{
            print(error.localizedDescription)
            return[]
        }
    }
    
    // sementara ambil object struct GardenModel
    func addGardenEntity(garden: GardenModel){
        let newGarden = GardenEntity(context: self.context)
        newGarden.name = garden.name
        newGarden.sizeArea = garden.sizeArea
        newGarden.location = garden.location
        newGarden.temp = garden.temp
        newGarden.humid = Int32(garden.humid)
        newGarden.kelvin = garden.kelvin
        newGarden.candleLight = garden.candleLight
        newGarden.candleLightNeed = Int32(garden.candleLightNeed)
        newGarden.methode = garden.methode
        newGarden.plant = garden.plant
        newGarden.availNum = Int32(garden.availNum)
        newGarden.isChecklistDone = garden.isChecklistDone
        newGarden.image = garden.image
        addToolsEntity(tools: garden.listTools)
        //newGarden.listTools = fetchTools()

        manager.saveData()
    }
    
    // MARK: ToolsEntity
    func fetchTools() -> [ToolsEntity]{
        do{
            return try context.fetch(NSFetchRequest<ToolsEntity>(entityName: "ToolsEntity"))
        }
        catch let error{
            print(error.localizedDescription)
            return []
        }
    }
    
    func addToolsEntity(tools: [ToolsItem]){
        let newTools = ToolsEntity(context: self.context)
        for(i) in tools.indices{
            let newTools = ToolsEntity(context: self.context)
            newTools.name = tools[i].name
            newTools.num = Int32(tools[i].num)
            newTools.checklist = tools[i].checklist
        }
        newTools.tooltype = "Alat"
        newTools.desc = """
"""
        newTools.function = """
"""
    }
}

class CoreDataManager{
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init(){
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print(error.localizedDescription)
            }
        }
        context = container.viewContext
    }
    
    func saveData(){
        do{
            try context.save()
        } catch let error{
            print(error.localizedDescription)
        }
    }
}
