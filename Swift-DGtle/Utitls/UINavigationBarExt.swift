//
//  UINavigationBarExt.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

extension UINavigationBar {

    static var overlayKey: String {
        get {
            return "OVERLAY_KEY"
        }
        
        set { }
    }
    
    // Since adding a stored value property for a class in it's extension is forbidden,
    // use runtime methods adding a new stored value property for a class.
    var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, UINavigationBar.overlayKey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, UINavigationBar.overlayKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func gg_setBackgroundColor(color: UIColor) {
        
        if overlay == nil {
            setBackgroundImage(UIImage(), forBarMetrics: .Default)
            overlay = UIView(frame: CGRectMake(0, -20, UIScreen .mainScreen().bounds.size.width, CGRectGetHeight(bounds) + 20))
            overlay?.userInteractionEnabled = false
            overlay?.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
            insertSubview(overlay!, atIndex: 0)
        }
        overlay?.backgroundColor = color
    }
    
    func gg_reset() {
        setBackgroundImage(nil, forBarMetrics: .Default)
        overlay?.removeFromSuperview()
        overlay = nil
    }
    
    func setBarTransparent() {
        gg_setBackgroundColor(UIColor.whiteColor().colorWithAlphaComponent(0.0))
        shadowImage = UIImage()
    }
    
}
