//
//  DefaultActiveTimersInteractor.swift
//  CustomizeTimer
//
//  Created by D_K on 18.01.2024.
//

import Foundation

protocol DefaultActiveTimersInteractorProvider {
    
}

final class DefaultActiveTimersInteractor: DefaultActiveTimersInteractorProvider {
    
    private let presenter: DefaultActiveTimersPresenterProvider
    
    private var activeTimers: [DefaultTimer] = []
    
    init(presenter: DefaultActiveTimersPresenterProvider) {
        self.presenter = presenter
    }
    
    func newTimerActivated() {
        
    }
}

