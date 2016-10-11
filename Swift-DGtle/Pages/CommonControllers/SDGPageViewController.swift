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
    
    var vcArray: [UIViewController] = []
    var curContentX: CGFloat = 0.0
    var horizentalScrollView = UIScrollView(frame: SCREEN_SIZE)
    
    //  禁用子控制器的自动更新视图 否则会一口气走完所有子控制器的视图加载方法
    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let idx = buttonsBar.selectedIndex {
            runApperenceTransition(forIndex: idx)
        } 
    }
    
    convenience init(bottonBar: ButtonsBar, viewControllers: [UIViewController]) {
        self.init()
        self.buttonsBar = bottonBar
        self.vcArray = viewControllers
    }
    
    ///  手动触发子控制器的视图加载周期
    ///
    /// - parameter index: 控制器索引
    fileprivate func runApperenceTransition(forIndex index: Int) {
        vcArray[index].beginAppearanceTransition(true, animated: true)
        vcArray[index].endAppearanceTransition()
    }

}

extension SDGPageViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)  {
        guard scrollView.contentOffset.x.truncatingRemainder(dividingBy: SCREEN_WIDTH) == 0 else {
            return
        }
        
        if scrollView.contentOffset.x != curContentX {
            curContentX = scrollView.contentOffset.x
        } else {
            return
        }
        
        buttonsBar.selectedIndex = Int(curContentX / SCREEN_WIDTH)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cx = scrollView.contentOffset.x
        buttonsBar.scrollUnderlineXPercentageTo(cx / SCREEN_WIDTH / CGFloat(vcArray.count - 1))
    }
    
}

extension SDGPageViewController: ButtonsBarDelegate {
    
    func buttonsBarDidSelectedindex(_ index: Int?)  {
        if let idx = index {
            horizentalScrollView.scrollRectToVisible(CGRect(x: CGFloat(idx) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), animated: true)
            
            runApperenceTransition(forIndex: idx)
        }
    }
}
