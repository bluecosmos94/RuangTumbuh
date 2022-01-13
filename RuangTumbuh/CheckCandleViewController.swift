//
//  CheckCandleViewController.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 20/11/21.
//

import UIKit
import ARKit
import RealityKit
import Accelerate

class CheckCandleViewController: UIViewController {

    var action : ()->() = {}
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var finisheBtn: RoundButton!
    @IBOutlet weak var cancelBtn: RoundButton!
    @IBOutlet weak var resultLabel: UILabel!

    
    var timer = Timer()
    var values : [Float] = [Float]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        runTimer()
        
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(checkCandleLight), userInfo: nil, repeats: true)
    }
    @objc func checkCandleLight(){
        guard let estimate = arView.session.currentFrame?.lightEstimate else {return}
        
        
        let value = Float(estimate.ambientIntensity / 10.76)
        let value2 = estimate.ambientColorTemperature
        let status = cekAmbient(num: value2)
                
        values.append(value)
        
        if values.count == 10 {
            let avg = vDSP.mean(values)
            var garden = UserDefaultService.shared.currentGarden
            resultLabel.text = """
            Tempat mu kurang terang nih. Coba ukur
            ulang di waktu matahari terik,
            atau menambah LED tambahan
            """
            garden.candleLight = Float(avg)
            garden.kelvin = status
            UserDefaultService.shared.saveToUDwithName(garden: garden)
            updateUI()
            timer.invalidate()
        }
    }
    
    func updateUI(){
        finisheBtn.isHidden.toggle()
        cancelBtn.isHidden.toggle()
        
//        resultLabel.isHidden.toggle()
        checkLabel.text = "Sudah Selesai Mengukur"
        checkImage.image = UIImage(systemName: "checkmark.circle")
        
    }
    
    func cekAmbient(num:CGFloat)->String{

        if  num < 5500 {
            return "Paparan langsung"
        }else{
            return "Bayangan"
        }
    }

    @IBAction func cancel(_ sender: Any) {
        runTimer()
        values.removeAll()
        finisheBtn.isHidden.toggle()
        cancelBtn.isHidden.toggle()
        
//        resultLabel.isHidden.toggle()
        checkLabel.text = "Arahkan ke Kebunmu"
        checkImage.image = UIImage(systemName: "checkmark.circle")
        resultLabel.text = """
        Sedang mengukur...
        """
        checkImage.image = UIImage(systemName: "sun.max")
    }
    @IBAction func finish(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "CandleLight", bundle: nil)
//        //MeasureDone
//        let viewController = storyboard.instantiateViewController(withIdentifier: "final")
//        self.navigationController?.show(viewController, sender: nil)
        action()
    }
    
    @IBAction func back(_ sender: Any) {
        
    }
}
