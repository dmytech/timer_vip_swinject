//
//  DefaultCreateTimerInteractor.swift
//  CustomizeTimer
//
//  Created by D_K on 14.02.2024.
//

import Foundation

protocol DefaultCreateTimerInteractorProvider {
    func start()
    func newTimerStarted(_ name: String, timestamp: TimeInterval)
}

final class DefaultCreateTimerInteractor: DefaultCreateTimerInteractorProvider {

    private let presenter: DefaultCreateTimerPresenterProvider
    
    private var recentTimers: [DefaultTimer] = []
    
    init(presenter: DefaultCreateTimerPresenterProvider) {
        self.presenter = presenter
    }
    
    func start() {
        presenter.start()
    }
    
    func newTimerStarted(_ name: String, timestamp: TimeInterval) {
        presenter.timerStartedSuccesful()
    }
    
    func newTimerStarted(_ name: String) {
        presenter.timerStartedSuccesful()
    }
}

