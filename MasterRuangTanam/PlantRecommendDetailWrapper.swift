//
//  PlantRecommendDetailWrapper.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 07/12/21.
//

import SwiftUI

struct PlantRecommendationDetailWrapper: UIViewControllerRepresentable{
    @EnvironmentObject var appdata: AppData
    @State var plant: PlantDetailItem
    
    func makeUIViewController(context: Context) -> PlantDetailViewController {
        let vc = UIStoryboard(name: "ChosePlant", bundle: Bundle.main).instantiateViewController(identifier: "detailPlant") as! PlantDetailViewController
        vc.action = {
            
            //let view = WrappARMeasureDone(garden:garden).environmentObject(appdata).ignoresSafeArea()
            //let vc = UIHostingController(rootView: view)
            
            //appdata.navigation?.show(vc, sender: nil)
        }
        vc.backAction = {
            appdata.navigation?.popViewController(animated: true)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: PlantDetailViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
}
