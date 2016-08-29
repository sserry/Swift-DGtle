//
//  SDGTabBarController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    func configureViewControllers() {
        let homeVC = SDGHomeViewController()
        let homeBarItem = UITabBarItem(title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_act"))
        homeVC.tabBarItem = homeBarItem
        let homeNavVC = SDGNavigationController(rootViewController: homeVC)
        
        let groupVC = SDGGroupViewController()
        let groupBarItem = UITabBarItem(title: "小组", image: UIImage(named: "tab_group"), selectedImage: UIImage(named: "tab_group_act"))
        groupVC.tabBarItem = groupBarItem
        let groupNavVC = SDGNavigationController(rootViewController: groupVC)
        
        let msgVC = SDGMsgViewController()
        let msgBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tab_inbox"), selectedImage: UIImage(named: "tab_inbox_act"))
        msgVC.tabBarItem = msgBarItem
        let msgNavVC = SDGNavigationController(rootViewController: msgVC)
        
        let mineVC = SDGMineViewController()
        mineVC.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tab_zone"), selectedImage: UIImage(named: "tab_zone_act"))
        let mineNavVC = SDGNavigationController(rootViewController: mineVC)
        
        viewControllers = [homeNavVC, groupNavVC, msgNavVC, mineNavVC]
    }
    
}
