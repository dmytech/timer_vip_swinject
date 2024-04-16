//
//  DefaultCreateTimerAssembly.swift
//  CustomizeTimer
//
//  Created by D_K on 14.02.2024.
//

import UIKit
import Swinject

final class DefaultCreateTimerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        
        container.register(DefaultCreateTimerCoordinator.self) { _ in DefaultCreateTimerCoordinator()}
            .initCompleted { r, router in
                router.view = r.resolve(BaseView.self, name: DefaultCreateTimerView.className)
            }
        
        container.register(DefaultCreateTimerPresenterProvider.self) { _ in DefaultCreateTimerPresenter()}
            .initCompleted { r, presenter in
                let p = presenter as! DefaultCreateTimerPresenter
                let v = r.resolve(BaseView.self, name: DefaultCreateTimerView.className) as? DefaultCreateTimerViewProvider
                p.view = v
            }
        
        container.register(DefaultCreateTimerInteractorProvider.self) { r in
            DefaultCreateTimerInteractor(
                presenter: r.resolve(DefaultCreateTimerPresenterProvider.self)!
            )
        }
        
        container.register(BaseView.self, name: DefaultCreateTimerView.className) { (r: Resolver) in
            DefaultCreateTimerView(
                interactor: r.resolve(DefaultCreateTimerInteractorProvider.self)!,
                coordinator: r.resolve(DefaultCreateTimerCoordinator.self)!
            )
        }.implements(DefaultTimerViewPage.self, name: DefaultCreateTimerView.className)
    }
}
