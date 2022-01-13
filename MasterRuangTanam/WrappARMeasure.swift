//
//  WrappARMeasure.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 29/11/21.
//

import SwiftUI

struct WrappARMeasure: UIViewControllerRepresentable {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    func makeUIViewController(context: Context) -> ARMeasureViewController {
        let vc = UIStoryboard(name: "MainFeature", bundle: Bundle.main).instantiateViewController(identifier: "measure") as! ARMeasureViewController
        vc.action = {
            
            let view = WrappARMeasureDone(garden:garden).environmentObject(appdata).ignoresSafeArea()
            let vc = UIHostingController(rootView: view)
            
            appdata.navigation?.show(vc, sender: nil)
        }
        vc.backActions = {
            appdata.navigation?.popViewController(animated: true)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: ARMeasureViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
}



struct WrappARMeasureDone: UIViewControllerRepresentable {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    func makeUIViewController(context: Context) -> MeasureDoneViewController {
        let vc = UIStoryboard(name: "MainFeature", bundle: Bundle.main).instantiateViewController(identifier: "MeasureDone") as! MeasureDoneViewController
        vc.action = {
            let vc = appdata.navigation?.viewControllers
            appdata.navigation?.popToViewController(vc![1], animated: true)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: MeasureDoneViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
    
    
}



struct WrappARCandleLight: UIViewControllerRepresentable {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    func makeUIViewController(context: Context) -> CheckCandleViewController {
        let vc = UIStoryboard(name: "CandleLight", bundle: Bundle.main).instantiateViewController(identifier: "check") as! CheckCandleViewController
        vc.action = {
            let view = WrappARCandleLightDone(garden:garden).environmentObject(appdata).ignoresSafeArea()
            let vc = UIHostingController(rootView: view)
            
            appdata.navigation?.show(vc, sender: nil)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: CheckCandleViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
    
    
}


struct WrappARCandleLightDone: UIViewControllerRepresentable {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    func makeUIViewController(context: Context) -> FinishedCandleLightViewController {
        let vc = UIStoryboard(name: "CandleLight", bundle: Bundle.main).instantiateViewController(identifier: "final") as! FinishedCandleLightViewController
        vc.action = {
            let vc = appdata.navigation?.viewControllers
            appdata.navigation?.popToViewController(vc![1], animated: true)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: FinishedCandleLightViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
    
    
}


struct WrappARAddMethode: UIViewControllerRepresentable {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    func makeUIViewController(context: Context) -> AddModelViewController {
        let vc = UIStoryboard(name: "ChooseMethode", bundle: Bundle.main).instantiateViewController(identifier: "addModel") as! AddModelViewController
        vc.action = {
            
            let view = DetailGardenChecklistView(garden: garden)
                .environmentObject(appdata)
                .ignoresSafeArea()
            let vc = UIHostingController(rootView: view)
            appdata.navigation?.show(vc, sender: nil)
        }
        return vc
    }
    
    func updateUIViewController(_ viewController: AddModelViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
    
    
}
