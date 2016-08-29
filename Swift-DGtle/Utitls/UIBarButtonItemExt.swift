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
    class func barBtnItemWithNmlImg(nmlImg: UIImage!,
                                    selImg: UIImage!,
                                    target: AnyObject!,
                                    action: Selector) -> UIBarButtonItem{
        let btn = UIButton(type: .Custom)
        
        btn.setImage(nmlImg, forState: .Normal)
        btn.setImage(selImg, forState: .Selected)
        btn.adjustsImageWhenHighlighted = false
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        btn.bounds = CGRectMake(0, 0, nmlImg.size.width, nmlImg.size.height)
        
        return UIBarButtonItem(customView: btn)
    }
}
