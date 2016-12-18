//
//  SDGRereshHeader.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import MJRefresh

class SDGRefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var whaleArray = [UIImage]()
        for i in 1..<11 {
            let img  = UIImage(named: "whale\(i)")
            whaleArray.append(img!)
        }
        setImages([whaleArray.last!], for: .idle)
        setImages(whaleArray, for: .refreshing)
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        applyToAllSubviews { $0.mj_y -= 10 }
    }

}
