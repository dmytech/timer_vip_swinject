//
//  IntExtension.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

extension Int {
    var timeFormatString: String {
        return self <= 0 ? "00" : "\(self)"
    }
}
