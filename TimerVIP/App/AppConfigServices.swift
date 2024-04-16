//
//  AppConfigServices.swift
//  VIP_Swinject
//
//  Created by D_K on 13.12.2023.
//

import Foundation
import UIKit

struct AppConfigServices {
    static var appDelegateServices: [UIApplicationDelegate] {
        let services: [UIApplicationDelegate] = []
        return services
    }
    
    static var sceneDelegateServices: [UISceneDelegate] {
        var services: [UISceneDelegate] = []
        
        let sceneModule = AppContainer.main.resolve(WindowRootEntity.self, name: TabBarWindowRoot.className)!
        let rootRouter = AppContainer.main.resolve(WindowRootServiceProvider.self, argument: sceneModule) as? UISceneDelegate
        services.append(rootRouter!)
        
        return services
    }
}
