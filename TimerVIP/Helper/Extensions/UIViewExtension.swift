//
//  UIViewExtension.swift
//  CustomizeTimer
//
//  Created by D_K on 16.01.2024.
//

import UIKit

extension UIView {
    var isVisible: Bool {
        get {
            return !isHidden
        }
        set {
            isHidden = !newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    func setupNibConstraints(_ contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func addCorenrView(_ corners: UIRectCorner, size: CGSize, color: UIColor) {
        let view = UIView(frame: CGRect(x: 15, y: -15, width: 10, height: 10))
        view.backgroundColor = .black
        self.addSubview(view)
    }
    
    enum BorderSide {
            case top
            case bottom
            case left
            case right
        }
        
    func addBorder(color: UIColor, thickness: CGFloat, sides: [BorderSide]) {
        for side in sides {
            let border = UIView()
            border.backgroundColor = color
            switch side {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: thickness)
                border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: thickness)
                border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.size.height)
                border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
            case .right:
                border.frame = CGRect(x: frame.size.width - thickness, y: 0, width: thickness, height: frame.size.height)
                border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
            }
            
            self.addSubview(border)
        }
    }
    
    func setShadow(color: UIColor?, radius: CGFloat, opacity: Float, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = .init(width: xOffset, height: yOffset)
        layer.masksToBounds = false
    }
}
