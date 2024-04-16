//
//  SceneDelegate.swift
//  VIP_Swinject_2.0
//
//  Created by D_K on 15.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var services = AppConfigServices.sceneDelegateServices

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        self.services.forEach { service in
            service.scene?(scene, willConnectTo: session, options: connectionOptions)
        }
    }
}

