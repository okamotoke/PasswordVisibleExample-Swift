//
//  JJPasswordTextField.swift
//  PasswordVisibleExample_Swift
//
//  Created by KO on 2018/01/15.
//  Copyright © 2018年 KO. All rights reserved.
//

import UIKit

private var visibleButton: UIButton!

class JJPasswordTextField: UITextField {

    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        visibleButton = UIButton()
        
        if (self.isSecureTextEntry) {
            visibleButton.setImage(UIImage(named:"visibility_off.png"), for: .normal)
        } else {
            visibleButton.setImage(UIImage(named:"visibility_on.png"), for: .normal)
        }
        
        visibleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        visibleButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        self.rightViewMode = .always
        self.rightView = visibleButton
        
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightBounds : CGRect
        rightBounds = CGRect(x: bounds.origin.x +  bounds.size.width - 30, y:bounds.origin.y + bounds.size.height/2 - 22, width: 30, height: 44)
        return rightBounds ;
    }
    
    @objc func togglePasswordVisibility(sender: UIButton) -> Void{
        if (self.isSecureTextEntry) {
            visibleButton.setImage(UIImage(named:"visibility_on.png"), for: .normal)
        } else {
            visibleButton.setImage(UIImage(named:"visibility_off.png"), for: .normal)
        }
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    
}
