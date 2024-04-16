//
//  StopwatchView.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import UIKit

protocol StopwatchViewProvider: AnyObject {
}

final class StopwatchView: BaseView, StopwatchViewProvider {
    
    private let interactor: StopwatchInteractorProvider
    private let coordinator: StopwatchCoordinator
    
    init(
        interactor: StopwatchInteractorProvider,
        coordinator: StopwatchCoordinator
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        
    }
}
