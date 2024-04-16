//
//  AppContainer.swift
//  VIP_Swinject_2.0
//
//  Created by D_K on 15.12.2023.
//

import Foundation
import Swinject

struct AppContainer {
    static let main = Container()
}

final class AppAssembler {
    static let shared = AppAssembler()
    
    private lazy var assembler = Assembler(container: AppContainer.main)
    
    func launchOption() {
        assembler.apply(assemblies: Assemblies.services)
        assembler.apply(assemblies: Assemblies.modules)
        assembler.apply(assemblies: Assemblies.entities)
    }
    
    func add(assembly: Assembly) {
        assembler.apply(assembly: assembly)
    }
    
    func add(assemblies: [Assembly]) {
        assembler.apply(assemblies: assemblies)
    }
}


