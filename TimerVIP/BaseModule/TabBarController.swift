//
//  TabBarController.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    private func setupAppearance() {
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = false
       
        let appearance = tabBar.standardAppearance
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.uiTabBarNonSelected,
            .font: AppFont.tabBarTitle
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.uiTabBarSelected,
            .font: AppFont.tabBarTitle
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .uiTabBarNonSelected
        appearance.stackedLayoutAppearance.selected.iconColor = .uiTabBarSelected
        appearance.backgroundColor = .uiTabBarBackground
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }

}
