//
//  UILabelExtension.swift
//  CustomizeTimer
//
//  Created by D_K on 17.01.2024.
//

import UIKit

extension UILabel {
    func setAttributedString(_ str: String, attributes: [NSAttributedString.Key: Any]) {
        attributedText = NSMutableAttributedString(string: str, attributes: attributes)
    }
}
