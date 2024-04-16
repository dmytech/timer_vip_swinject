//
//  AppDelegate.swift
//  VIP_Swinject_2.0
//
//  Created by D_K on 15.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let assembler = AppAssembler.shared
    private lazy var services = AppConfigServices.appDelegateServices

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        assembler.launchOption()
        let result: Bool = services.map { service in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }.contains(where: {$0 != false})
        return result
    }
}

