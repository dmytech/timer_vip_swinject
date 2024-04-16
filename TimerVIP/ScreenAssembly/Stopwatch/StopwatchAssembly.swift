//
//  StopwatchAssembly.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import UIKit
import Swinject

final class StopwatchAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        
        container.register(StopwatchCoordinator.self) { _ in StopwatchCoordinator()}
            .initCompleted { r, router in
                router.view = r.resolve(BaseView.self, name: StopwatchView.className)
            }
        
        container.register(StopwatchPresenterProvider.self) { _ in StopwatchPresenter()}
            .initCompleted { r, presenter in
                let p = presenter as! StopwatchPresenter
                let v = r.resolve(BaseView.self, name: StopwatchView.className) as? StopwatchViewProvider
                p.view = v
            }
        
        container.register(StopwatchInteractorProvider.self) { r in
            StopwatchInteractor(
                presenter: r.resolve(StopwatchPresenterProvider.self)!
            )
        }
        
        container.register(BaseView.self, name: StopwatchView.className) { (r: Resolver) in
            StopwatchView(
                interactor: r.resolve(StopwatchInteractorProvider.self)!,
                coordinator: r.resolve(StopwatchCoordinator.self)!
            )
        }
    }
}
