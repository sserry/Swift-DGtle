//
//  UILabelExt.swift
//  designMan
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

//有内边距的label
class DMLabel: UILabel {
    var insets: UIEdgeInsets = UIEdgeInsetsZero
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
    
}

extension UILabel {
    
    class func labelWithFontSize(fontSize: CGFloat, textColor color: UIColor, fontWeight: CGFloat, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(fontSize, weight: fontWeight)
        label.textColor = color
        label.text = text
        label.textAlignment = textAlign
        return label
    }
    
    class func labelWithThinFontSize(fontSize: CGFloat, textColor color: UIColor, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        return UILabel.labelWithFontSize(fontSize, textColor: color, fontWeight: UIFontWeightThin, labelText: text, textAlign: textAlign)
    }
    
    class func labelWithNormalFontSize(fontSize: CGFloat, textColor color: UIColor, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        return UILabel.labelWithFontSize(fontSize, textColor: color, fontWeight: UIFontWeightRegular, labelText: text, textAlign: textAlign)
    }
    
}