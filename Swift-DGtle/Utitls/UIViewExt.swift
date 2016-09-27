//
//  UIViewExt.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

extension UIView {

    //递归应用到所有的子视图
    func applyToAllSubviews(_ closure: (UIView) -> Void) {
        
        if subviews.count == 0 { return }
        
        for subview in subviews {
            closure(subview)
            subview.applyToAllSubviews(closure)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return  layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        
        set {
            layer.borderColor = newValue!.cgColor
        }
    }
    
    var gg_w: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            frame.size.width = newValue
        }
    }
    
    var gg_h: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var gg_x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var gg_y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

}
