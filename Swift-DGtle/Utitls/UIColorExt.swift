//
//  UIColorExt.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

public let DEFAULT_VOID_COLOR = UIColor.whiteColor()

extension UIColor {
    class func colorWithHexString(stringToConvert: String) -> UIColor {
        var cString: String = stringToConvert.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if cString.characters.count < 6 {
            return DEFAULT_VOID_COLOR
        }
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(cString.startIndex.successor())
        }
        if cString.characters.count != 6 {
            return DEFAULT_VOID_COLOR
        }
        
        let rString = cString.substringWithRange(Range(cString.startIndex..<cString.startIndex.advancedBy(2)))
        let gString = cString.substringWithRange(Range(cString.startIndex.advancedBy(2)..<cString.startIndex.advancedBy(4)))
        let bString = cString.substringWithRange(Range(cString.startIndex.advancedBy(4)...cString.startIndex.advancedBy(5)))
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255,
                       green: CGFloat(g) / 255,
                       blue: CGFloat(b) / 255, alpha: 1.0)
    }
}