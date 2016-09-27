//
//  UIColorExt.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

public let DEFAULT_VOID_COLOR = UIColor.white

extension UIColor {
    class func colorWithHexString(_ stringToConvert: String) -> UIColor {
        var cString: String = stringToConvert.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.characters.count < 6 {
            return DEFAULT_VOID_COLOR
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.characters.index(after: cString.startIndex))
        }
        if cString.characters.count != 6 {
            return DEFAULT_VOID_COLOR
        }
        
        let rString = cString.substring(with: Range(cString.startIndex..<cString.characters.index(cString.startIndex, offsetBy: 2)))
        let gString = cString.substring(with: Range(cString.characters.index(cString.startIndex, offsetBy: 2)..<cString.characters.index(cString.startIndex, offsetBy: 4)))
        let bString = cString.substring(with: Range(cString.characters.index(cString.startIndex, offsetBy: 4)...cString.characters.index(cString.startIndex, offsetBy: 5)))
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255,
                       green: CGFloat(g) / 255,
                       blue: CGFloat(b) / 255, alpha: 1.0)
    }
}
