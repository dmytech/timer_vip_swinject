//
//  SettingsPresenter.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

protocol SettingsPresenterProvider {
    
}

final class SettingsPresenter: SettingsPresenterProvider {
    weak var view: SettingsViewProvider?
}
