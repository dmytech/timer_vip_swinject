//
//  DefaultTimerAssembly.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit
import Swinject

final class DefaultTimerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        
        container.register(DefaultTimerCoordinator.self) { _ in DefaultTimerCoordinator()}
            .initCompleted { r, router in
                router.view = r.resolve(BaseView.self, name: DefaultTimerView.className)
            }
        
        container.register(BaseView.self, name: DefaultTimerView.className) { r in
            DefaultTimerView(
                coordinator: r.resolve(DefaultTimerCoordinator.self)!,
                pages: (
                    list: r.resolve(DefaultTimerViewPage.self, name: DefaultActiveTimersView.className)!,
                    create: r.resolve(DefaultTimerViewPage.self, name: DefaultCreateTimerView.className)!
                )
            )
        }
    }
}
