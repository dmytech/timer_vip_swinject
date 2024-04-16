//
//  StopwatchInteractor.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

protocol StopwatchInteractorProvider {
    
}

final class StopwatchInteractor: StopwatchInteractorProvider {
    
    private let presenter: StopwatchPresenterProvider
    
    init(presenter: StopwatchPresenterProvider) {
        self.presenter = presenter
    }
}

