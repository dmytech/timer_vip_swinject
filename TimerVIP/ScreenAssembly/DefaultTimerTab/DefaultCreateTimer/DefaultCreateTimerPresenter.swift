//
//  DefaultCreateTimerPresenter.swift
//  CustomizeTimer
//
//  Created by D_K on 14.02.2024.
//

import Foundation

protocol DefaultCreateTimerPresenterProvider {
    func start()
    func timerStartedSuccesful()
}

final class DefaultCreateTimerPresenter: DefaultCreateTimerPresenterProvider {

    weak var view: DefaultCreateTimerViewProvider?
    
    func start() {
        view?.currentTimerNameSet("Timer 1")
        view?.defaultSongSet("Jing bing")
    }
    
    func timerStartedSuccesful() {
        view?.timerCreated(total: 2)
    }
}
