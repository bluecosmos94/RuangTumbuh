//
//  GeoTrackingViewController.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 09/11/21.
//

import UIKit
import ARKit
import RealityKit
import Photos
import MapKit

class GeoTrackingViewController: UIViewController, ARSessionDelegate {

    let coachingLocation = ARCoachingOverlayView()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //arView.session.delegate = self
    }
  

}
