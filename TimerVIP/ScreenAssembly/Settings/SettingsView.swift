//
//  SettingsView.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import UIKit

protocol SettingsViewProvider: AnyObject {
}

final class SettingsView: BaseView, SettingsViewProvider {
    
    private let interactor: SettingsInteractorProvider
    private let coordinator: SettingsCoordinator
    
    init(
        interactor: SettingsInteractorProvider,
        coordinator: SettingsCoordinator
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
