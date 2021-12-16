//
//  Weather_AppApp.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 06/12/21.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    @StateObject private var iconSettings = IconNames()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(iconSettings)
        }
    }
}

// App Icon Switch

//var supportsAlternateIcons: Bool = false

//public func setAlternateIconName(_ alternateIconName: String?, completionHandler: ((Error?) -> Void)? = nil)
//
//public var alternateIconName: String? { get }

//enum AppIcon: CaseIterable {
//   case classic,
//   sun,
//   snow,
//   thunder    
//}
//
//
//
//var name: String? {
//  switch self {
//  case .classic:
//    return nil
//  case .sun:
//    return "sunIcon"
//  case .snow:
//    return "snowIcon"
//  case .thunder:
//    return "thunderIcon"
//  }
//}
//
//var preview: UIImage {
//  switch self {
//  case .classic:
//    return #imageLiteral(resourceName: "App Icon classic")
//  case .sun:
//    return #imageLiteral(resourceName: "WeatherAppSun")
//  case .snow:
//    return #imageLiteral(resourceName: "snow@2x.png")
//  case .thunder:
//    return #imageLiteral(resourceName: "thunder@2x.png")
//  }
//}
//
//var current: AppIcon {
//  return AppIcon.allCases.first(where: {
//    $0.name == UIApplication.shared.alternateIconName
//  }) ?? .classic
//}
//
//func setIcon(_ appIcon: AppIcon, completion: ((Bool) -> Void)? = nil) {
//  
//  guard current != appIcon,
//    UIApplication.shared.supportsAlternateIcons
//    else { return }
//        
//  UIApplication.shared.setAlternateIconName(appIcon.name) { error in
//    if let error = error {
//      print("Error setting alternate icon \(appIcon.name ?? ""): \(error.localizedDescription)")
//    }
//    completion?(error != nil)
//  }
//}
