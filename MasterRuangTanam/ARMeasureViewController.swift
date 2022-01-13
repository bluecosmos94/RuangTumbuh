//
//  MainFeatureViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 26/10/21.
//

import UIKit
import ARKit
import RealityKit
import FocusEntity

class ARMeasureViewController: UIViewController{
    
    @IBOutlet weak var arView: ARView!
    
    //start
    @IBOutlet weak var undoButtonView: RoundButton!
    @IBOutlet weak var addButtonView: RoundButton!
    
    public var focusSquare : FocusEntity!
    
    //finish
    @IBOutlet weak var cancelButton: RoundButton!
    @IBOutlet weak var continueButton: RoundButton!
    
    var action : ()->() = {}
    var backActions : ()->() = {}
    
    var pathEntity : RKPathEntity!
    var controlPath : RKPathEntity!
    
    let convex = ConvexHull()
    var arrPoint = [CGPoint]()
    var area = 0.0
    
    var listPoints = [SIMD3<Float>]()
    var isMeasuring = false
    var isDoneMeasureing = false
    
    // Weather
    var weatherResult: Result!
    var tempNow: Double?
    var humidityNow: Int?
    
    // Location
    var currentCity = ""
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?
    
    var gardenImage = Data()
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.session.delegate = self
        navigationController?.navigationBar.isHidden = true
        getLocation()
        startPlaneDetection()
//                    self.focusSquare = FocusEntity(on: arView, focus: .classic)
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
    
    var ambientStatus : String = ""
    
    @IBAction func addButton(_ sender: Any) {
        if !isDoneMeasureing{
            isMeasuring = true
            
            if !focusSquare.onPlane{
                return
            }
            if let path = pathEntity {
                self.arView.scene.removeAnchor(path)
            }
            
            
            let position = self.focusSquare.position(relativeTo: nil)
            
            pathEntity = RKPathEntity(arView: arView,
                                      path: listPoints,
                                      width: 0.01,
                                      materials: [UnlitMaterial.init(color: .white)])
            
            pathEntity.pathPoints.append(position)
            listPoints.append(position)
            
            isDoneMeasureing = isAreaClossed()
            
            if isDoneMeasureing{
                pathEntity.pathPoints.removeLast()
                listPoints.removeLast()
                pathEntity.pathPoints.append(listPoints.first!)
                listPoints.append(listPoints.first!)
            }
        }else{
            
            
            arView.snapshot(saveToHDR: true) { [weak self] image in
                guard let self = self else {return}
                self.hideStartView()
                self.gardenImage = image?.pngData() ?? Data()
            }

            arView.alpha = 0.5
            
            guard let estimate = arView.session.currentFrame?.lightEstimate else {return}
            
            let ambientColourTemperature = estimate.ambientColorTemperature
            ambientStatus = cekAmbient(num: ambientColourTemperature)
           
            
            
        }
    }
    
    func getArea(){
        for p in listPoints{
            let pin = CGPoint(x: CGFloat(p.x), y: CGFloat(p.z))
            arrPoint.append(pin)
        }
        
        convex.quickHull(points: arrPoint)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        area = convex.area()
        area = area * 10000
        
    }
    
    func isAreaClossed()->Bool{
        if listPoints.count <= 2{
            return false
        }else{
            guard let awal = listPoints.first else {return false}
            guard let akhir = listPoints.last else {return false}
            
            let distance = simd_distance(awal, akhir) * 100
            if distance < 5{
                
                addButtonView.backgroundColor = UIColor(named: "myGreen") ?? .green
                addButtonView.tintColor = .white
                addButtonView.setImage(UIImage(systemName: "checkmark"), for: .normal)
                getArea()
                isMeasuring = false
                
                return true
            }
        }
        return false
    }
    
    @IBAction func undoButton(_ sender: Any) {
        if let path = pathEntity {
            self.arView.scene.removeAnchor(path)
        }
        
        if let _ = listPoints.last{
            listPoints.removeLast()
        }

        pathEntity = RKPathEntity(arView: arView,
                                  path: listPoints,
                                  width: 0.01,
                                  materials: [UnlitMaterial.init(color: .white)])
        
        if let last = listPoints.last {
            pathEntity.pathPoints.append(last)
        }
        
    }
    
    func hideStartView(){
        self.undoButtonView.isHidden.toggle()
        self.addButtonView.isHidden.toggle()
        self.continueButton.isHidden.toggle()
        self.cancelButton.isHidden.toggle()
    }
    
    func cekAmbient(num:CGFloat)->String{

        if  num < 5500 {
            return "Paparan langsung"
        }else{
            return "Bayangan"
        }
    }
    
    func startPlaneDetection(){
        if #available(iOS 13.4, *),
           ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification) {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = .horizontal
            configuration.sceneReconstruction = .meshWithClassification
            configuration.isLightEstimationEnabled = true
            arView.session.run(configuration)
            
            //Allows objects to be occluded by the sceneMesh.
            arView.environment.sceneUnderstanding.options.insert(.occlusion)
            
            //show colored mesh.
//            self.arView.debugOptions.insert(.showSceneUnderstanding)
        } else{
            arView.automaticallyConfigureSession = false
            let config = ARWorldTrackingConfiguration()
            
            config.planeDetection = .horizontal
            config.isLightEstimationEnabled = true
            
            arView.session.run(config)
            
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        isDoneMeasureing = false
        arView.alpha = 1
        if let path = pathEntity {
            self.arView.scene.removeAnchor(path)
        }
        listPoints = []
        hideStartView()
        addButtonView.backgroundColor = .white.withAlphaComponent(0.6)
        addButtonView.setImage(UIImage(systemName: "plus"), for: .normal)
        addButtonView.tintColor = .black
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        if (area < 1){
            let alert = UIAlertController(title: "Luas Tidak Cukup!", message: "Maaf, luas lahan Anda kurang dari 1 cm2! Mohon diukur ulang lagi!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Kembali", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else{
            
            var garden = UserDefaultService.shared.currentGarden
            garden.sizeArea = Float(area)
            garden.location = currentCity
            garden.temp = Float(tempNow ?? 0.0)
            garden.humid = humidityNow ?? 0
            garden.image = gardenImage

            UserDefaultService.shared.saveToUDwithName(garden: garden)
            
            action()
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        backActions()
    }
    
    func getWeather(){
        WeatherService.weather.getWeather(onSuccess: { (result) in
            self.weatherResult = result
            
            self.weatherResult?.sortDailyArray()
            self.weatherResult?.sortHourlyArray()
            
            self.tempNow = self.weatherResult?.current.temp
            self.humidityNow = self.weatherResult?.current.humidity
            
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }

    func getLocation(){
        if(CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
            
            print("Location service activated")
        }
    }
   
}


extension ARMeasureViewController: ARSessionDelegate{
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        if isMeasuring{
            if let path = controlPath {
                self.arView.scene.removeAnchor(path)
            }
            if !listPoints.isEmpty{
                if focusSquare.onPlane{
                    var controlPoint = [SIMD3<Float>]()
                    controlPoint.append(listPoints.last ?? SIMD3<Float>())
                    controlPath = RKPathEntity(arView: arView,
                                                  path: controlPoint,
                                                 width: 0.01,
                                                  materials: [UnlitMaterial.init(color: .white)])
//                    var point = focusSquare.position
//                    point.z = 0
                    controlPath.pathPoints.append(focusSquare.position)
                }
            }
        }else{
            if let path = controlPath {
                self.arView.scene.removeAnchor(path)
            }
        }
    }
    
}

extension ARMeasureViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // mengambil location paling akhir dari array karena location terbaru terletak di index terakhir
        if let location = locations.last, self.currentLocation == nil{
            self.currentLocation = location
            
            let latitude: Double = self.currentLocation!.coordinate.latitude
            let longitude: Double = self.currentLocation!.coordinate.longitude
            
            WeatherService.weather.setLatitude(latitude)
            WeatherService.weather.setLongitude(longitude)

            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
                if let placemarks = placemarks{
                    if placemarks.count > 0{
                        let placemark = placemarks[0]
                        if let city = placemark.locality{
                            self.currentCity = city
                        }
                    }
                }
            }
            getWeather()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
    }
}
