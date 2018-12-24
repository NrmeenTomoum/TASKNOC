//
//  ViewController.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/22/18.
//  Copyright © 2018 MobileNOC. All rights reserved.
//
import UIKit
@IBDesignable class ProfileImage:UIImageView {
    
     @IBInspectable var isCircular: Bool = false {
        didSet {
            self.setNeedsLayout()
        }
    }
        override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        self.applyProperties()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setNeedsDisplay()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsDisplay()
    }

    override func layoutSubviews() {
        self.applyProperties()
    }
    func applyProperties()
    {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.cornerRadius = isCircular ? CGFloat(self.frame.size.height / 2.0) :  5
        
        self.layer.masksToBounds = true
        self.layer.addSublayer(shapeLayer)
        }
    
}
