//
//  ActiveDefaultTimerTableCellModel.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

struct ActiveDefaultTimerTableCellModel {
    var indexPath: IndexPath
    var name: String
    var hours: Int
    var minutes: Int
    var seconds: Int
    var isActive: Bool
    var endTime: String
}
