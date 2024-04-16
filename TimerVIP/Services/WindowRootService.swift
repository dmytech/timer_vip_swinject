//
//  WindowRootService.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import Foundation
import UIKit

protocol WindowRootServiceProvider {
    func setRoot(root: WindowRootEntity)
}

class WindowRootService: NSObject, WindowRootServiceProvider, UISceneDelegate {
    
    var window: UIWindow?
    
    private var root: WindowRootEntity
    
    init(window: UIWindow? = nil, root: WindowRootEntity) {
        self.window = window
        self.root = root
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        setRoot(root: root)
    }
    
    func setRoot(root: WindowRootEntity) {
        window?.rootViewController = root.getRoot()
        window?.makeKeyAndVisible()
    }
}
