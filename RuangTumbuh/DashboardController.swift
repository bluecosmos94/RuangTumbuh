//
//  DashboardController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import UIKit
import SwiftUI

class DashboardController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let window = self.view.window
        let nav = self.navigationController
        addSubSwiftUIView(DashboardView()
                            .environmentObject(AppData(window: window, navigation: nav))
                            .background(Color("myGray"))
                            .ignoresSafeArea(), to: self.view)
    }
    
    
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


final class AppData: ObservableObject {
    static let shared  : AppData = AppData()
    
    var window: UIWindow? // Will be nil in SwiftUI previewers
    var navigation : UINavigationController?
    
    init(window: UIWindow? = nil, navigation : UINavigationController? = nil) {
        self.window = window
        self.navigation = navigation
    }
    
}
