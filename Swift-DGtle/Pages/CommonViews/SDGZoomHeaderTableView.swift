//
//  SDGZoomHeaderTableView.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGZoomHeaderTableView: UITableView {

    var zoomingHeader: UIView?
    var windowSize = CGRectZero
    
    override func drawRect(rect: CGRect) {
        
        if tableHeaderView == nil {
            let transparentHeader = UIView(frame: windowSize)
            transparentHeader.backgroundColor = UIColor.clearColor()
            backgroundColor = UIColor.clearColor()
            tableHeaderView = transparentHeader
        }
        
        zoomingHeader?.frame = CGRectMake(0, 0, zoomingHeader!.gg_w, zoomingHeader!.gg_h)
        if let sv = superview {
            sv.addSubview(zoomingHeader!)
            sv.insertSubview(zoomingHeader!, belowSubview: self)
        }
    }
    
    convenience init(zoomingHeader: UIView, windowSize: CGRect) {
        self.init(frame: SCREEN_SIZE, style: .Grouped)
        self.zoomingHeader = zoomingHeader
        self.windowSize = windowSize
        backgroundColor = UIColor.clearColor()
    }
    
    func zoomingHeaderforScale(scale: CGFloat) {
        if scale > 1 {
            zoomingHeader?.frame = CGRectMake((1 - scale) * windowSize.size.width / 2, 0, windowSize.size.width * scale, windowSize.size.height * scale)
        }
    }
 
}
