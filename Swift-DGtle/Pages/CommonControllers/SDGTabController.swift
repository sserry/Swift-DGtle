//
//  SDGTabController.swift
//  Swift-DGtle
//
//  Created by apple on 16/9/2.
//  Copyright © 2016 luminia. All rights reserved.
//

import UIKit

class SDGTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers() 
    }
    
    func configureViewControllers() {
        let homeVC = SDGHomeViewController()
        let homeBarItem = UITabBarItem(title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_act"))
        homeVC.tabBarItem = homeBarItem
        let homeNavVC = SDGNavigationController(rootViewController: homeVC)
        
        let bar = ButtonsBar(frame: CGRect(x: 0, y: 0, width: 180, height: 44), titlesArray: ["精选", "发现"], buttonMargin: 84)
        let leftVC = SDGGroupLeftChildViewController()
        let rightVC = SDGGroupRightChildViewController()
        let groupVC = SDGPageViewController(bottonBar: bar, viewControllers: [leftVC, rightVC])
        let groupBarItem = UITabBarItem(title: "小组", image: UIImage(named: "tab_group"), selectedImage: UIImage(named: "tab_group_act"))
        groupVC.tabBarItem = groupBarItem
        let groupNavVC = SDGNavigationController(rootViewController: groupVC)
        
        let msVC = SDGMsgCommentChildViewController()
        let likeVC = SDGMsgLikeChildViewController()
        let pmVC = SDGMsgPrivateChildViewController()
        let btnBar = ButtonsBar(frame: CGRect(x: 0, y: 0, width: 205, height: 44), titlesArray: ["评论", "赞", "私信"], buttonMargin: 38)
        let msgVC = SDGPageViewController(bottonBar: btnBar, viewControllers: [msVC, likeVC, pmVC])
        let msgBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tab_inbox"), selectedImage: UIImage(named: "tab_inbox_act"))
        msgVC.tabBarItem = msgBarItem
        let msgNavVC = SDGNavigationController(rootViewController: msgVC)
        
        let mineVC = SDGMineViewController()
        mineVC.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tab_zone"), selectedImage: UIImage(named: "tab_zone_act"))
        let mineNavVC = SDGNavigationController(rootViewController: mineVC)
        
        viewControllers = [homeNavVC, groupNavVC, msgNavVC, mineNavVC]
    }


}
