//
//  BaseView.swift
//  VIP_Swinject
//
//  Created by D_K on 12.12.2023.
//

import UIKit

class BaseView: UIViewController {
    
    public var isModalyPresented = false
    var identity: String = "BaseView"
    
    init() {
        self.identity = String(describing: Self.self)
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .uiViewBackground
    }
}

extension BaseView {
    
    class func view<T>(_ name: BaseView.Type, dataInject: T? = nil) -> BaseView {
        if let dataInject {
            AppContainer.main.register(T.self) { _ in dataInject}
        }
        return AppContainer.main.resolve(BaseView.self, name: name.className)!
    }
}
