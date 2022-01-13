//
//  AddModelViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 17/11/21.
//

import UIKit
import RealityKit
import ARKit
import FocusEntity
import SwiftUI

class AddModelViewController: UIViewController {
    
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var undoBtn: RoundButton!
    @IBOutlet weak var addBtn: RoundButton!
    @IBOutlet weak var finishBtn: RoundButton!
    @IBOutlet weak var cancelBtn: RoundButton!
    @IBOutlet weak var doneBtn: RoundButton!
    
    
    @IBOutlet weak var statusView: RoundView!
    
    public var focusSquare : FocusEntity!
    
    var listAnchor : [AnchorEntity] = [AnchorEntity]()
    var dataImage = Data()
    
    var numMethode = 0
    var maxNum = 0
    var area :Float = 0.0
    
    var action:()->()={}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        area = UserDefaultService.shared.currentGarden.sizeArea

        addBtn.layer.cornerRadius = addBtn.frame.width/2
        finishBtn.layer.cornerRadius = finishBtn.frame.width/2
        startPlaneDetection()
        setupFocusEntity()
        
        maxNum = Int(area / 10000)
        
        changeStatus()
        
    }
    
    func changeStatus(){
        statusText.text = "\(numMethode) dari \(maxNum)"
    }
    
    func setupFocusEntity(){
        do {
            let onColor: MaterialColorParameter = try .texture(.load(named: "Add"))
            let offColor: MaterialColorParameter = try .texture(.load(named: "Open"))
            self.focusSquare = FocusEntity(
                on: arView,
                style: .colored(
                    onColor: onColor, offColor: offColor,
                    nonTrackingColor: offColor
                )
            )
        } catch {
            self.focusSquare = FocusEntity(on: arView, focus: .classic)
            print("Unable to load plane textures")
            print(error.localizedDescription)
        }
    }
    
    func startPlaneDetection(){
        if #available(iOS 13.4, *),
           ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = .horizontal
            configuration.sceneReconstruction = .meshWithClassification
            configuration.isLightEstimationEnabled = true
            arView.session.run(configuration)
            
            //Allows objects to be occluded by the sceneMesh.
            arView.environment.sceneUnderstanding.options.insert(.occlusion)
            
            //show colored mesh.
            //self.arView.debugOptions.insert(.showSceneUnderstanding)
        } else{
            arView.automaticallyConfigureSession = false
            let config = ARWorldTrackingConfiguration()
            
            config.planeDetection = [.horizontal]
            config.environmentTexturing = .automatic
            config.isLightEstimationEnabled = true
            
            arView.session.run(config)
        }
    }
    
    @IBAction func undo(_ sender: Any) {
        if let last = listAnchor.last {
            arView.scene.removeAnchor(last)
            listAnchor.removeLast()
            numMethode-=1
            area = area + 10000.0
            changeStatus()
        } else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func add(_ sender: Any) {
        
        print(area)
        
        finishBtn.isEnabled = true
        
        if !focusSquare.onPlane{
            return
        }
        
        if area > 10000{
            
            numMethode+=1
            
            var ball = ModelEntity()
            
            ball = try! ModelEntity.loadModel(named: UserDefaultService.shared.currentMethode.name, in: .main)
            ball.generateCollisionShapes(recursive: true)
            
            
            let anchor = AnchorEntity(world: focusSquare.position)
            
            anchor.addChild(ball)
            listAnchor.append(anchor)
            
            arView.scene.addAnchor(anchor)
            arView.installGestures([.translation,.rotation], for: ball)
            
            area = area - 10000.0
            changeStatus()
//            statusText.text! = "\n available for \( Int(area/10000.0))"
            
        }else if numMethode == 0{
            statusText.text = "Area Ruangan Terlalu Kecil Untuk Metode Ini"
        }else{
            statusText.text = "Area Ruangan Terlalu Kecil Untuk Menambah"
        }
        
    }
    
    @IBAction func finishedAdding(_ sender: Any) {
        //        summaryText.isHidden.toggle()
        arView.scene.removeAnchor(focusSquare)
        arView.snapshot(saveToHDR: true) { [weak self] image in
            guard let self = self else {return}
            self.doneBtn.isHidden.toggle()
            self.cancelBtn.isHidden.toggle()
//            self.statusView.isHidden.toggle()
            
            self.finishBtn.isHidden.toggle()
            self.undoBtn.isHidden.toggle()
            self.addBtn.isHidden.toggle()
            
            self.dataImage = image?.pngData() ?? Data()
        }
        
    }
    func crateEntity(color:UIColor)->ModelEntity{
        let mesh = MeshResource.generateSphere(radius: 0.01)
        
        let material = SimpleMaterial(color: color, roughness: 0, isMetallic: true)
        
        let entity = ModelEntity(mesh: mesh, materials: [material])
        
        return entity
    }
    @IBAction func saveMethode(_ sender: Any) {
        var garden : GardenModel = UserDefaultService.shared.currentGarden
        garden.methode = UserDefaultService.shared.currentMethode.name
        garden.plant = UserDefaultService.shared.currentPlant.name
        garden.availNum = numMethode * 40
        garden.image = dataImage
        
        var tools = UserDefaultService.shared.currentMethode.tools
        if !tools.isEmpty{
            tools[0].num = numMethode
            tools[1].num = numMethode * 20
        }
        if Int(garden.candleLightNeed) >= Int(garden.candleLight) {
            tools.append(ToolsItem(name: "LED Lamp 240 fc", num: 1, tooltype: "bahan",desc: "Lampu LED adalah produk diode pancaran cahaya (LED) yang disusun menjadi sebuah lampu. Lampu LED memiliki usia pakai dan efisiensi listrik beberapa kali lipat lebih balik daripada lampu pijar",function: "Menyesuaikan kebutuhan sinar untuk pertumbuhan tanaman"))
        }
        let plant = UserDefaultService.shared.currentPlant
        //Bahan lain
        tools.append(ToolsItem(name: "Benih \(plant.name)", num: numMethode * 40, tooltype: "bahan"))
        tools.append(ToolsItem(name: "RockWool", num: 1, tooltype: "bahan"))
        tools.append(ToolsItem(name: "Nutrisi AB Mix", num: 1, tooltype: "bahan"))
        
        
        
        garden.listTools = tools
        
        UserDefaultService.shared.saveToUDwithName(garden: garden)
        
        action()
        
        
        
    }
    
}


