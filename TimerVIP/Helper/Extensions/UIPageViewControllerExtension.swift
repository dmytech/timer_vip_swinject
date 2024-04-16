//
//  UIPageViewControllerExtension.swift
//  CustomizeTimer
//
//  Created by D_K on 16.02.2024.
//

import UIKit

extension UIPageViewController {
    func setPage(_ page: BaseView,
                 direction: UIPageViewController.NavigationDirection,
                 completion: ClosureType<Bool>? = nil) {
        setViewControllers([page], direction: direction, animated: true, completion: completion)
    }
}
