//
//  UINavigationBarExt.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

fileprivate var overlayKey: String = "NAV_OVERLAY_KEY"

extension UINavigationBar {
    
    // Since adding a stored value property for a class in it's extension is forbidden,
    // use runtime methods adding a new stored value property for a class.
    var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, &overlayKey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &overlayKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func gg_setBackgroundColor(_ color: UIColor) {
        
        if overlay == nil {
            setBackgroundImage(UIImage(), for: .default)
            overlay = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.size.width, height: bounds.height + 20))
            overlay?.isUserInteractionEnabled = false
            overlay?.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(UIViewAutoresizing.flexibleHeight)
            insertSubview(overlay!, at: 0)
        }
        overlay?.backgroundColor = color
    }
    
    func gg_reset() {
        setBackgroundImage(nil, for: .default)
        overlay?.removeFromSuperview()
        overlay = nil
    }
    
    func setBarTransparent() {
        gg_setBackgroundColor(UIColor.white.withAlphaComponent(0.0))
        shadowImage = UIImage()
    }
    
}
