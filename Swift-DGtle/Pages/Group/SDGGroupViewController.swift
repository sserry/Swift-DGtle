//
//  SDGGroupViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupViewController: UIViewController, SDGPageProtocol {
    
    let buttonsBar = ButtonsBar(frame: CGRectMake(0, 0, 180, 44), titlesArray: ["精选", "发现"], buttonMargin: 84)
    let leftVC = SDGGroupLeftChildViewController()
    let rightVC = SDGGroupRightChildViewController()
    var vcArray: [UIViewController] {
        return [leftVC, rightVC]
    }
    var curContentX: CGFloat = 0.0
    var horizentalScrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        navigationItem.titleView = buttonsBar
        buttonsBar.delegate = self

        setupControllers()
    }

}

extension SDGGroupViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        guard scrollView.contentOffset.x % SCREEN_WIDTH == 0 else {
            return
        }
        
        if scrollView.contentOffset.x != curContentX {
            curContentX = scrollView.contentOffset.x
        } else {
            return
        }
        
        buttonsBar.selectedIndex = Int(curContentX / SCREEN_WIDTH)
    }
}

extension SDGGroupViewController: ButtonsBarDelegate {
    func buttonsBarDidSelectedindex(index: Int?) {
        if let idx = index {
            horizentalScrollView?.scrollRectToVisible(CGRectMake(CGFloat(idx) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT), animated: true)
        }
    }
}