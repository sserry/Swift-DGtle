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
    var windowSize = CGRect.zero
    
    override func draw(_ rect: CGRect) {
        
        if tableHeaderView == nil {
            let transparentHeader = UIView(frame: windowSize)
            transparentHeader.backgroundColor = UIColor.clear
            backgroundColor = UIColor.clear
            tableHeaderView = transparentHeader
        }
        
        zoomingHeader?.frame = CGRect(x: 0, y: 0, width: zoomingHeader!.gg_w, height: zoomingHeader!.gg_h)
        if let sv = superview {
            sv.addSubview(zoomingHeader!)
            sv.insertSubview(zoomingHeader!, belowSubview: self)
        }
    }
    
    convenience init(zoomingHeader: UIView, windowSize: CGRect) {
        self.init(frame: SCREEN_SIZE, style: .grouped)
        self.zoomingHeader = zoomingHeader
        self.windowSize = windowSize
        backgroundColor = UIColor.clear
    }
    
    func zoomingHeaderforScale(_ scale: CGFloat) {
        if scale > 1 {
            zoomingHeader?.frame = CGRect(x: (1 - scale) * windowSize.size.width / 2, y: 0, width: windowSize.size.width * scale, height: windowSize.size.height * scale)
        }
    }
 
}
