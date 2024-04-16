//
//  NavigationController.swift
//  Passport_Photo
//
//  Created by D_K on 23.06.2023.
//

import UIKit
import Swinject

class NavigationControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NavigationController.self) { (r: Resolver, name: String) in
            NavigationController(rootViewController: r.resolve(BaseView.self, name: name)!)
        }
    }
}

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        return .default
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupAppearance(isDark: false)
    }
    
    func setupAppearance(isDark: Bool) {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .uiBlue
        navigationBar.tintColor = .uiWhiteHeader
        navigationItem.largeTitleDisplayMode = .never
        navigationBar.titleTextAttributes = [
            .font : AppFont.header,
            .foregroundColor : UIColor.uiWhiteHeader
        ]
//        let backImage = Assets.Icons.backArrow
//        UINavigationBar.appearance().backIndicatorImage = backImage
//            UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0), for:UIBarMetrics.default)
    }

}

extension NavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        guard let view = viewController as? BaseView else {return}
//        if view.isNeedShowNavBar {
//            navigationController.setNavigationBarHidden(false, animated: true)
//        } else {
//            navigationController.setNavigationBarHidden(true, animated: true)
//        }
//
//        if shouldBigNavigationBar.contains(where: { viewController.isKind(of: $0) }) {
//            navigationController.navigationBar.prefersLargeTitles = true
//        } else {
//            navigationController.navigationBar.prefersLargeTitles = false
//        }
//
//        if applicationService.shouldDarkNavigationBar.contains(where: { viewController.isKind(of: $0) }) {
//            setupAppearance(isDark: true)
//        } else {
//            setupAppearance(isDark: false)
//        }
//
//
//
    }
    
}
