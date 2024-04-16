//
//  UITableViewExtension.swift
//  CustomizeTimer
//
//  Created by D_K on 18.02.2024.
//

import UIKit

extension UITableView {
    func registerCell(_ cellClass: AnyClass) {
        let className = String(describing: cellClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let className = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: className, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(className)")
        }
        return cell
    }
    
    func calculateHeight(completion: Closure? = nil) {
        let heightConstraint = constraints.first(where: {
            $0.firstItem is UITableView &&
            $0.firstAttribute == .height && ($0.relation == .equal || $0.relation == .greaterThanOrEqual)
        })
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if self.frame.size != self.contentSize {
                    self.frame.size = self.contentSize
                    heightConstraint?.constant = self.frame.size.height
                    completion?()
                }
            }
        }) { (_) in
            self.layoutIfNeeded()
        }
        
    }
}
