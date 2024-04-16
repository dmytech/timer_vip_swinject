//
//  Coordinator.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit

class Coordinator {
    weak var view: BaseView?
    
    func push(to nextView: BaseView, animated: Bool = true) {
        if let navigation = view?.navigationController {
            navigation.pushViewController(nextView, animated: animated)
        } else {
            fatalError("Navigation not available")
        }
    }
    
    func present(presentView: BaseView, style: UIModalPresentationStyle = .automatic, animated: Bool = true) {
        presentView.modalPresentationStyle = style
        presentView.isModalyPresented = true
        view?.present(presentView, animated: animated)
    }
    
    func close(animated: Bool = true, completion: Closure? = nil) {
        guard let view else {return}
        if view.isModalyPresented {
            view.dismiss(animated: animated, completion: completion)
        } else {
            view.navigationController?.popViewController(animated: animated)
        }
    }
}
