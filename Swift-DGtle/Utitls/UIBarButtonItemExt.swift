//
//  UIBarButtonItemExt.swift
//  designMan
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

//重写设置barItem方法
extension UIBarButtonItem {
    class func barBtnItemWithNmlImg(_ nmlImg: UIImage!,
                                    selImg: UIImage!,
                                    target: AnyObject!,
                                    action: Selector) -> UIBarButtonItem{
        let btn = UIButton(type: .custom)
        
        btn.setImage(nmlImg, for: UIControlState())
        btn.setImage(selImg, for: .selected)
        btn.adjustsImageWhenHighlighted = false
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        btn.bounds = CGRect(x: 0, y: 0, width: nmlImg.size.width, height: nmlImg.size.height)
        
        return UIBarButtonItem(customView: btn)
    }
}
