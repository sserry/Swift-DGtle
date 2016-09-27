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
    var insets: UIEdgeInsets = UIEdgeInsets.zero
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
}

extension UILabel {
    
    class func labelWithFontSize(_ fontSize: CGFloat, textColor color: UIColor, fontWeight: CGFloat, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = color
        label.text = text
        label.textAlignment = textAlign
        return label
    }
    
    class func labelWithThinFontSize(_ fontSize: CGFloat, textColor color: UIColor, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        return UILabel.labelWithFontSize(fontSize, textColor: color, fontWeight: UIFontWeightThin, labelText: text, textAlign: textAlign)
    }
    
    class func labelWithNormalFontSize(_ fontSize: CGFloat, textColor color: UIColor, labelText text: String?, textAlign: NSTextAlignment) -> UILabel {
        return UILabel.labelWithFontSize(fontSize, textColor: color, fontWeight: UIFontWeightRegular, labelText: text, textAlign: textAlign)
    }
    
}
