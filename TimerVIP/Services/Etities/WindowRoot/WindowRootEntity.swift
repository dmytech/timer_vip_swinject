//
//  WindowRootEntity.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit
import Swinject

protocol WindowRootEntity {
    func getRoot() -> UIViewController
}

final class WindowRootEntityAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(WindowRootEntity.self,
                           name: TabBarWindowRoot.className,
                           factory: { _ in
            TabBarWindowRoot()
        })
    }
}
