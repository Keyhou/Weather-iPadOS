//
//  SceneDelegate.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 14/12/21.
//

import UIKit
import SwiftUI

// Trying to get alternative icon with each weather

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo sesion: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
    let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(IconNames()))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    
    }
    
    func sceneDidBecomeActive(_ scene:UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
}




class IconNames: ObservableObject {
    var iconNames : [String?] = [nil]
    @Published var currentIndex = 0
    init() {
        getAlernateIcons()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }

    func getAlernateIcons() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String : Any],
           let alternateIcons  = icons["CFBundleAlternateIcons"] as? [String : Any]
            /*Bundle.main.object(forInfoDictionaryKey: "CFBundleAlternateIcons")*/ {
            
            for(_, value) in alternateIcons {
                guard let iconList = value as? Dictionary<String, Any> else {return}
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else {return}
                
                guard let icon = iconFiles.first else {return}
                
                iconNames.append(icon)
            }
        }
    }
}
 
