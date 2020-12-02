//
//  DesignableButton.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 25/11/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadPerc: CGFloat = 0.1
    @IBInspectable var topLeftCorner: Bool = true
    @IBInspectable var topRightCorner: Bool = true
    @IBInspectable var bottomLeftCorner: Bool = true
    @IBInspectable var bottomRightCorner: Bool = true

    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable public var borderColor: UIColor = UIColor.clear

    @IBInspectable var shadowColor: UIColor = UIColor.clear
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowX: Int = 2
    @IBInspectable var shadowY: Int = 2
    @IBInspectable var shadowRadius: Int = 0
    
    @IBInspectable var shakeRepeat: Int = 2
    @IBInspectable var shakeDuration: CGFloat = 0.1
    @IBInspectable var shakeDistX: Int = 8
    @IBInspectable var shakeDistY: Int = 0
    
    private var stateStr: String = "available"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupButton()
    }
    
    private func setupButton() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadPerc * min(bounds.size.width, bounds.size.height)
        layer.maskedCorners = CACornerMask(
            TL: topLeftCorner,
            TR: topRightCorner,
            BL: bottomLeftCorner,
            BR: bottomRightCorner)

        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = CGFloat(shadowRadius)
    }

    
    public func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = CFTimeInterval(shakeDuration)
        shake.repeatCount = Float(shakeRepeat)
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - CGFloat(shakeDistX), y: center.y - CGFloat(shakeDistY))
        let fromValue = NSValue(cgPoint: fromPoint)

        let toPoint = CGPoint(x: center.x + CGFloat(shakeDistX), y: center.y + CGFloat(shakeDistY))
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func available() {
        layer.opacity = 1
        isEnabled = true
        isHidden = false
        
        stateStr = "available"
    }
    
    func unavailable() {
        layer.opacity = 0.5
        isEnabled = false
        isHidden = false

        stateStr = "unavailable"
    }
    
    func hidden() {
        layer.opacity = 0
        isEnabled = false
        isHidden = true
        
        stateStr = "hidden"
    }
    
    func state() -> String {
        return stateStr
    }
    
}
