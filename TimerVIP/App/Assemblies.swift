//
//  Assemblies.swift
//  VIP_Swinject_2.0
//
//  Created by D_K on 15.12.2023.
//

import Foundation
import Swinject

struct Assemblies {
    static var services: [Assembly] {
        [
            ServicesAssembly()
        ]
    }
    
    static var entities: [Assembly] {
        [
            WindowRootEntityAssembly()
            
        ]
    }
    
    static var modules: [Assembly] {
        [
            NavigationControllerAssembly(),
            DefaultTimerAssembly(),
            DefaultActiveTimersAssembly(),
            DefaultCreateTimerAssembly(),
            StopwatchAssembly(),
            SettingsAssembly()
        ]
    }
}
