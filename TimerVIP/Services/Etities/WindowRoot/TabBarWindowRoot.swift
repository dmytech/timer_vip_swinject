//
//  TabBarWindowRoot.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit

class TabBarWindowRoot: NSObject, WindowRootEntity {
    
    private let container = AppContainer.main
    
    func getRoot() -> UIViewController {
        
        let defaultTimer = container.resolve(NavigationController.self, argument: DefaultTimerView.className)!
        defaultTimer.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -4, right: 0)
        defaultTimer.tabBarItem.title = L.text(.timer_tab_bar)
        defaultTimer.tabBarItem.image = UIImage.tabBarDefaultTimer
        
        let stopwatch = container.resolve(NavigationController.self, argument: StopwatchView.className)!
        stopwatch.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -4, right: 0)
        stopwatch.tabBarItem.title = L.text(.stopwatch_tab_bar)
        stopwatch.tabBarItem.image = UIImage.tabBarStopwatch
        
        let settings = container.resolve(NavigationController.self, argument: SettingsView.className)!
        settings.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -4, right: 0)
        settings.tabBarItem.title = L.text(.settings_tab_bar)
        settings.tabBarItem.image = UIImage.tabBarTemplate
        
        let tabBarController = TabBarController(
            viewControllers: [
                defaultTimer,
                stopwatch,
                settings
            ])
        return tabBarController
        
    }
    
    
}
