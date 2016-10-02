//
//  UITextFieldExt.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/2.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable var attributedPlaceholderColor: UIColor? {
        get {
            if let atPh = attributedPlaceholder {
                var range = NSMakeRange(0, atPh.length)
                return attributedPlaceholder?.attribute("NSForegroundColorAttributeName", at: 0, effectiveRange: &range) as! UIColor?
            } else {
                return nil
            }
        }
        set {
            let range = NSMakeRange(0, attributedPlaceholder!.length)
            let mutableAttributedStr = NSMutableAttributedString(attributedString: attributedPlaceholder ?? NSAttributedString(string: placeholder ?? ""))
            mutableAttributedStr.setAttributes([NSForegroundColorAttributeName: newValue!], range: range)
            attributedPlaceholder = mutableAttributedStr
        }
    }
    
}
