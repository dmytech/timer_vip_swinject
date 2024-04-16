//
//  TimeBase.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import Foundation

struct TimeBase {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    func getTimeStamp() -> Double {
        let totalSeconds = hours * 3600 + minutes * 60 + seconds
        return TimeInterval(totalSeconds)
    }
}
