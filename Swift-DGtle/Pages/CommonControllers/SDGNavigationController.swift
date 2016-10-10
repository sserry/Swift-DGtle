//
//  SDGNavigationController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        
        navigationBar.addObserver(self, forKeyPath: "barStyle", options: .new, context: nil)
    }
    
    deinit {
        navigationBar.removeObserver(self, forKeyPath: "barStyle")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "barStyle" {

            let newValue = change?[.newKey] as? Int
            let titleColor = UIColor.colorWithHexString(stringToConvert: newValue == UIBarStyle.black.rawValue ? "ffffff" : "4a4a4a")
            let textAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold),
                                  NSForegroundColorAttributeName: titleColor]
            navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    fileprivate func setupStyle() {
        
        //这玩意儿全局的
        let navigationBarApperence = UINavigationBar.appearance()
        navigationBarApperence.tintColor = UIColor.colorWithHexString(stringToConvert: "69707a")
        
//        let backImg = UIImage(named: "nav_bar_new")
//        navigationBarApperence.setBackgroundImage(backImg, for: .default)
        
        let textAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold),
                              NSForegroundColorAttributeName: UIColor.colorWithHexString(stringToConvert: "4a4a4a")]
        navigationBarApperence.titleTextAttributes = textAttributes
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            let backButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back"), style: .plain, target: self, action: #selector(SDGNavigationController.backButtonClicked(_:)))
            viewController.navigationItem.leftBarButtonItem = backButtonItem
            viewController.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsetsMake(0, -12, 0, 0)
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }

}


// MARK: - button events
extension SDGNavigationController {

    func backButtonClicked(_ sender: UIBarButtonItem) {
        popViewController(animated: true)
    }
}
