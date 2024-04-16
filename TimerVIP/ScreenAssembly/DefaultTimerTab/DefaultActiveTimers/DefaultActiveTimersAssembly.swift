//
//  DefaultActiveTimersAssembly.swift
//  CustomizeTimer
//
//  Created by D_K on 18.01.2024.
//

import UIKit
import Swinject

final class DefaultActiveTimersAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        
        container.register(DefaultActiveTimersCoordinator.self) { _ in DefaultActiveTimersCoordinator()}
            .initCompleted { r, router in
                router.view = r.resolve(BaseView.self, name: DefaultActiveTimersView.className)
            }
        
        container.register(DefaultActiveTimersPresenterProvider.self) { _ in DefaultActiveTimersPresenter()}
            .initCompleted { r, presenter in
                let p = presenter as! DefaultActiveTimersPresenter
                let v = r.resolve(BaseView.self, name: DefaultActiveTimersView.className) as? DefaultActiveTimersViewProvider
                p.view = v
            }
        
        container.register(DefaultActiveTimersInteractorProvider.self) { r in
            DefaultActiveTimersInteractor(
                presenter: r.resolve(DefaultActiveTimersPresenterProvider.self)!
            )
        }
        
        container.register(BaseView.self, name: DefaultActiveTimersView.className) { (r: Resolver) in
            DefaultActiveTimersView(interactor: r.resolve(DefaultActiveTimersInteractorProvider.self)!, coordinator: r.resolve(DefaultActiveTimersCoordinator.self)!)
        }.implements(DefaultTimerViewPage.self, name: DefaultActiveTimersView.className)
    }
}
