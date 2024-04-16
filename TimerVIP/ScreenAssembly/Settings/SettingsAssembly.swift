//
//  SettingsAssembly.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import UIKit
import Swinject

final class SettingsAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        
        container.register(SettingsCoordinator.self) { _ in SettingsCoordinator()}
            .initCompleted { r, router in
                router.view = r.resolve(BaseView.self, name: SettingsView.className)
            }
        
        container.register(SettingsPresenterProvider.self) { _ in SettingsPresenter()}
            .initCompleted { r, presenter in
                let p = presenter as! SettingsPresenter
                let v = r.resolve(BaseView.self, name: SettingsView.className) as? SettingsViewProvider
                p.view = v
            }
        
        container.register(SettingsInteractorProvider.self) { r in
            SettingsInteractor(
                presenter: r.resolve(SettingsPresenterProvider.self)!
            )
        }
        
        container.register(BaseView.self, name: SettingsView.className) { (r: Resolver) in
            SettingsView(
                interactor: r.resolve(SettingsInteractorProvider.self)!,
                coordinator: r.resolve(SettingsCoordinator.self)!
            )
        }
    }
}
