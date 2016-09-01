//
//  SDGPageViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGPageViewController: UIViewController, SDGPageProtocol {
    
    var buttonsBar = ButtonsBar()
//    var buttonsBar = ButtonsBar(frame: CGRectMake(0, 0, 180, 44), titlesArray: ["精选", "发现"], buttonMargin: 84)
//    let leftVC = SDGGroupLeftChildViewController()
//    let rightVC = SDGGroupRightChildViewController()
    
    var vcArray: [UIViewController] = []
    var curContentX: CGFloat = 0.0
    var horizentalScrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    convenience init(bottonBar: ButtonsBar, viewControllers: [UIViewController]) {
        self.init()
        self.buttonsBar = bottonBar
        self.vcArray = viewControllers
    }

}

extension SDGPageViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)  {
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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let cx = scrollView.contentOffset.x
        buttonsBar.scrollUnderlineXPercentageTo(cx / SCREEN_WIDTH / CGFloat(vcArray.count - 1))
    }
    
}

extension SDGPageViewController: ButtonsBarDelegate {
    
    
    func buttonsBarDidSelectedindex(index: Int?)  {
        if let idx = index {
            horizentalScrollView.scrollRectToVisible(CGRectMake(CGFloat(idx) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT), animated: true)
        }
    }
}