//
//  DefaultActiveTimersPresenter.swift
//  CustomizeTimer
//
//  Created by D_K on 18.01.2024.
//

import Foundation

protocol DefaultActiveTimersPresenterProvider {
    
}

final class DefaultActiveTimersPresenter: DefaultActiveTimersPresenterProvider {
    weak var view: DefaultActiveTimersViewProvider?
}
