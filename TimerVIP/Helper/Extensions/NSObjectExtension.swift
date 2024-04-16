//
//  NSObjectExtension.swift
//  Architectures_UIKit
//
//  Created by D_K on 13.12.2023.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: Self.self)
    }
}
