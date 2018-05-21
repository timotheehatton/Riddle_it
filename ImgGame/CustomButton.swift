//
//  CustomButton.swift
//  ImgGame
//
//  Created by Timothee Hatton on 21/05/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ FirstColor.cgColor, SecondColor.cgColor]
        layer.startPoint = CGPoint(x: 1, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 0)
    }
    
}
