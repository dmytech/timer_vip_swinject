//
//  AppLabel.swift
//  CustomizeTimer
//
//  Created by D_K on 17.01.2024.
//

import Foundation
import UIKit

class AppLabel: UILabel {
    struct CustomAttrText {
        var text: String
        var font: UIFont?
        var color: UIColor?
    }
    
    //MARK: - Parameters
    var lineHeight: CGFloat = 22
    var kern: CGFloat?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        initialSetup()
    }
    
    func initialSetup() {}
    
    var attributes: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font ?? UIFont.systemFont(ofSize: 17, weight: .regular),
            .foregroundColor: textColor ?? .black,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: (lineHeight - font.lineHeight) / 4
        ]
        
        if let kern {
            attributes[.kern] = kern
        }
        
        return attributes
    }
    
    func customText(texts: [CustomAttrText]) {
        let attrStr = NSMutableAttributedString()
        for text in texts {
            var attrs = attributes
            if let font = text.font {
                attrs[.font] = font
            }
            if let color = text.color {
                attrs[.foregroundColor] = color
            }
            attrStr.append(NSAttributedString(string: text.text, attributes: attrs))
        }
        attributedText = attrStr
    }
    
    override var text: String? {
        didSet {
            let finishText = text ?? ""
            setAttributedString(finishText, attributes: attributes)
        }
    }
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = lineHeight
        let text = (attributedText?.string ?? (text ?? "")) as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    

}

@IBDesignable class BarlowMedium40: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Medium_40
        lineHeight = 42
        
    }
}

@IBDesignable class HeaderLabel: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.header
        lineHeight = 32
    }
}

@IBDesignable class BarlowBold28: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Bold_28
        lineHeight = 34
    }
}

@IBDesignable class BarlowBold24: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Bold_24
        lineHeight = 29
    }
}

@IBDesignable class BarlowMedium18: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Medium_18
        lineHeight = 22
    }
}


@IBDesignable class BarlowBold16: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Bold_16
        lineHeight = 19
    }
}

@IBDesignable class BarlowMedium15: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Medium_15
        lineHeight = 18
    }
}

@IBDesignable class BarlowMedium14: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Medium_14
        lineHeight = 17
    }
}
@IBDesignable class BarlowMedium12: AppLabel {
    override func initialSetup() {
        super.initialSetup()
        font = AppFont.Barlow_Medium_12
        lineHeight = 14
    }
}
