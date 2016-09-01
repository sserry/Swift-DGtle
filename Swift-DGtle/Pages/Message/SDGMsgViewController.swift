//
//  SDGMsgViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMsgViewController: UIViewController, SDGPageProtocol {
    
    var horizentalScrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
    let msgVC = SDGMsgCommentChildViewController()
    let likeVC = SDGMsgLikeChildViewController()
    let pmVC = SDGMsgPrivateChildViewControlle()
    var vcArray: [UIViewController] {
        return [msgVC, likeVC, pmVC]
    }
    var curContentX: CGFloat = 0.0
    
    let buttonsBar = ButtonsBar(frame: CGRectMake(0, 0, 205, 44), titlesArray: ["评论", "赞", "私信"], buttonMargin: 38)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    
}


extension SDGMsgViewController: UIScrollViewDelegate {
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

extension SDGMsgViewController: ButtonsBarDelegate {
    
    func buttonsBarDidSelectedindex(index: Int?)  {
        if let idx = index {
            horizentalScrollView.scrollRectToVisible(CGRectMake(CGFloat(idx) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT), animated: true)
        }
    }
}