//
//  SDGPageProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit


protocol SDGPageProtocol: class {
    var vcArray: [UIViewController] { get }
    var horizentalScrollView: UIScrollView? { get set }
}

extension SDGPageProtocol where Self: UIScrollViewDelegate, Self: UIViewController {
    var _horizentalScrollView: UIScrollView? {
        get {
            if horizentalScrollView == nil {
                let scrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
                scrollView.pagingEnabled = true
                scrollView.directionalLockEnabled = true
                scrollView.showsVerticalScrollIndicator = false
                scrollView.showsHorizontalScrollIndicator = false
                scrollView.delegate = self
                scrollView.bounces = false
                for i in vcArray.indices {
                    vcArray[i].view.frame = CGRectMake(CGFloat(i) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                    scrollView.addSubview(vcArray[i].view)
                }
                scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * CGFloat(vcArray.count), SCREEN_HEIGHT)
                horizentalScrollView = scrollView
            }
            return horizentalScrollView
        }
    }
    
    func setupControllers() {
        for controller in vcArray {
            addChildViewController(controller)
        }
        if let hrView = _horizentalScrollView {
            view.addSubview(hrView)
        }
    }
}

