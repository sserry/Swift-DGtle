//
//  SDGPageProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

/**
 *  分页控制器协议
 */
protocol SDGPageProtocol: class {
    var vcArray: [UIViewController] { get }
    var horizentalScrollView: UIScrollView { get }
    var curContentX: CGFloat { get set }
    var buttonsBar: ButtonsBar { get }
}

extension SDGPageProtocol where Self: UIScrollViewDelegate, Self: UIViewController, Self: ButtonsBarDelegate {

    
    func setupControllers() {
        
        navigationItem.titleView = buttonsBar
        buttonsBar.delegate = self
 
        automaticallyAdjustsScrollViewInsets = false
        horizentalScrollView.isPagingEnabled = true
        horizentalScrollView.bounces = false
        horizentalScrollView.delaysContentTouches = true
        horizentalScrollView.isDirectionalLockEnabled = true
        horizentalScrollView.showsVerticalScrollIndicator = false
        horizentalScrollView.showsHorizontalScrollIndicator = false
        horizentalScrollView.alwaysBounceVertical = false

        for i in vcArray.indices {
            vcArray[i].view.frame = CGRect(x: CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            horizentalScrollView.addSubview(vcArray[i].view)
            addChildViewController(vcArray[i])
        }
        horizentalScrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(vcArray.count), height: horizentalScrollView.gg_h)
        view.addSubview(horizentalScrollView)
        horizentalScrollView.delegate = self
        
    }

}

