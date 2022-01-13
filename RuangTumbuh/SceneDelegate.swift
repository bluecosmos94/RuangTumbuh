//
//  SceneDelegate.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 21/10/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "myGreen") ?? .black ]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "myGreen") ?? .black]
        UINavigationBar.appearance().backgroundColor = UIColor(named: "myGray")
        
        if let windowScene = scene as? UIWindowScene {
//            for Testing
//            let window = UIWindow(windowScene: windowScene)
//            let storyboard = UIStoryboard(name: "PerencanaanKebun", bundle: nil)
//
//            let viewController = storyboard.instantiateViewController(withIdentifier: "checklist")
//            window.rootViewController = viewController
//            self.window = window
//            window.makeKeyAndVisible()
            
            if !UserDefaultService.shared.isOnboarding(){
                let window = UIWindow(windowScene: windowScene)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                let viewController = storyboard.instantiateViewController(withIdentifier: "onBoarding")
                window.rootViewController = viewController
                self.window = window
                window.makeKeyAndVisible()
            }
            else{
                let window = UIWindow(windowScene: windowScene)
                
                let dashboard = DashboardController(nibName: "DashboardController", bundle: nil)
//                dashboard.body = DashboardView().body
                let navigationController  = UINavigationController(rootViewController: dashboard)
                
                DissolveAnimation(view: window)
                window.rootViewController = navigationController
                window.tintColor = UIColor(named: "myGreen")
                self.window = window
                window.makeKeyAndVisible()
                
            }
            
        }
        if #available(iOS 13.0, *) {
    
            window?.overrideUserInterfaceStyle = .light
        }
//        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//       
//        self.window?.rootViewController = viewController
//        self.window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


func DissolveAnimation(view: UIView){
    let options: UIView.AnimationOptions = .transitionCrossDissolve

    // The duration of the transition animation, measured in seconds.
    let duration: TimeInterval = 0.5

    // Creates a transition animation.
    // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
    
    UIView.transition(with: view, duration: duration, options: options, animations: {}, completion:
    { completed in
        // maybe do something on completion here
    })
}

extension UIViewController {

    /// Add a SwiftUI `View` as a child of the input `UIView`.
    /// - Parameters:
    ///   - swiftUIView: The SwiftUI `View` to add as a child.
    ///   - view: The `UIView` instance to which the view should be added.
    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content : View {
        let hostingController = UIHostingController(rootView: swiftUIView)

        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

        /// Setup the contraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        /// Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)
    }
}
