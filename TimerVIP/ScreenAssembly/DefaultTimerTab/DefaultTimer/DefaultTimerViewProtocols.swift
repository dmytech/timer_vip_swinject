//
//  DefaultTimerViewProtocols.swift
//  CustomizeTimer
//
//  Created by D_K on 16.02.2024.
//

import UIKit

protocol DefaultTimerViewPage where Self : BaseView {
    var parentView: DefaultTimerViewParent? {get set}
    var pageNumber: Int {get set}
}

protocol DefaultTimerViewParent: AnyObject {
    func timersCountBtnCenter(for view: UIView) -> CGPoint
    func updatedTimers(total count: Int)
}
