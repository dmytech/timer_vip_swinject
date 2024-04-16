//
//  ServiceAssambly.swift
//  VIP_Swinject
//
//  Created by D_K on 13.12.2023.
//

import UIKit
import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        let rootWindow = container.register(WindowRootServiceProvider.self) { r, module in
            WindowRootService(root: module)
        }.inObjectScope(.container)
        container.forward(UISceneDelegate.self, to: rootWindow)
    }
}
