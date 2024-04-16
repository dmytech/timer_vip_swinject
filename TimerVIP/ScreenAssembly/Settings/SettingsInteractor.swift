//
//  SettingsInteractor.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

protocol SettingsInteractorProvider {
    
}

final class SettingsInteractor: SettingsInteractorProvider {
    
    private let presenter: SettingsPresenterProvider
    
    init(presenter: SettingsPresenterProvider) {
        self.presenter = presenter
    }
}

