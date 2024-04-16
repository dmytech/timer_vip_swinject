//
//  StopwatchPresenter.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

protocol StopwatchPresenterProvider {
    
}

final class StopwatchPresenter: StopwatchPresenterProvider {
    weak var view: StopwatchViewProvider?
}
