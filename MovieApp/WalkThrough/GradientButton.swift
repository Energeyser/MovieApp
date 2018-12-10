//
//  CAGradientLayer.swift
//  MovieApp
//
//  Created by axel on 05/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit



@IBDesignable
class GradientButton: UIButton {

    let gradientLayer = CAGradientLayer()

    
    @IBInspectable
    var leftGradientColor: UIColor? {
        didSet {
            setGradient(leftGradientColor: leftGradientColor, rightGradientColor: rightGradientColor)
        }
    }
    
    @IBInspectable
    var rightGradientColor: UIColor? {
        didSet {
            setGradient(leftGradientColor: leftGradientColor, rightGradientColor: rightGradientColor)
        }
    }
    
    private func setGradient(leftGradientColor: UIColor?, rightGradientColor: UIColor?) {
        if let leftGradientColor = leftGradientColor, let rightGradientColor = rightGradientColor {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5);
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5);
            gradientLayer.frame = bounds
            gradientLayer.colors = [leftGradientColor.cgColor, rightGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = 20
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
