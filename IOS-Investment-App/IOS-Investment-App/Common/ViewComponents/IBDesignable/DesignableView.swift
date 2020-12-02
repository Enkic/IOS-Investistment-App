//
//  DesignableView.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 25/11/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var cornerRadiusPercent: CGFloat = 0
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear

    @IBInspectable var topLeftCorner: Bool = true
    @IBInspectable var topRightCorner: Bool = true
    @IBInspectable var bottomLeftCorner: Bool = true
    @IBInspectable var bottomRightCorner: Bool = true
    
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.6
    @IBInspectable var shadowX: Int = 0
    @IBInspectable var shadowY: Int = 0
    @IBInspectable var shadowRadius: Int = 6


    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadiusPercent * min(bounds.size.width, bounds.size.height)
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
    
}
