//
//  CHControls.swift
//  PilotPlant
//
//  Created by Lingostar on 2015. 11. 21..
//  Copyright © 2015년 LingoStar. All rights reserved.
//

import UIKit

@IBDesignable open class RoundRectButton: UIButton {
    
    @IBInspectable open var corner:Double = 0.0 {
        didSet {
            self.layer.cornerRadius = CGFloat(corner)
        }
    }
    @IBInspectable open var border:Double = 0.0 {
        didSet {
            self.layer.borderWidth = CGFloat(border)
        }
    }
    
    override open var isHighlighted : Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = self.tintColor
                self.layer.borderColor = self.titleColor(for: .highlighted)?.cgColor
                
            } else {
                self.backgroundColor = UIColor.clear
                self.layer.borderColor = self.tintColor?.cgColor
            }
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        //self.layer.cornerRadius = 8
        //self.layer.borderWidth = 2
        self.layer.borderColor = self.tintColor?.cgColor
        self.setTitleColor(UIColor.white, for: .highlighted)
    }
}


@IBDesignable
open class CircleMaskImageView : UIImageView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0;
        self.layer.masksToBounds = true;
        self.layer.borderWidth = 0;
    }
}


@IBDesignable
open class CircleDotButton : CircleButton {
    var selectedLayer:CAShapeLayer = CAShapeLayer()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let buttonSize = CGSize(width:self.bounds.size.width / 3.0, height: self.bounds.size.height / 3.0)
        let center = CGPoint(x:self.bounds.center.x - (buttonSize.width / 2.0) , y : self.bounds.center.y - (buttonSize.height / 2.0))
        let selectedDotRect = CGRect(origin: center, size: buttonSize)
        
        selectedLayer.path = UIBezierPath(ovalIn: selectedDotRect).cgPath
        selectedLayer.backgroundColor = UIColor.black.cgColor
        selectedLayer.opacity = 0.3
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if isSelected == true {
            self.layer.addSublayer(selectedLayer)
        } else {
            selectedLayer.removeFromSuperlayer()
        }
    }
}

@IBDesignable
open class CircleButton : UIButton {
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0;
        self.layer.masksToBounds = true;
        self.layer.borderWidth = 0;
        
    }
}

@IBDesignable
open class CircleImageButton : UIButton {
    var selectedLayer:CALayer = CALayer()
    var darkenLayer:CALayer = CALayer()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        selectedLayer.contents = UIImage(named: "filter_list_slider")?.cgImage

        darkenLayer.backgroundColor = UIColor.black.cgColor
        darkenLayer.opacity = 0.5
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.size.height / 2.0;
        self.layer.masksToBounds = true;
        self.layer.borderWidth = 0;
        
        if isSelected == true {
            self.layer.addSublayer(darkenLayer)
            self.layer.addSublayer(selectedLayer)
        } else {
            darkenLayer.removeFromSuperlayer()
            selectedLayer.removeFromSuperlayer()
        }
    }
}
