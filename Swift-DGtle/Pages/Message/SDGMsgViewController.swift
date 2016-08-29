//
//  SDGMsgViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMsgViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        let titleButtonBar = ButtonsBar(frame: CGRectMake(0, 0, 205, 44), titlesArray: ["评论", "赞", "私信"], buttonMargin: 38)
        navigationItem.titleView = titleButtonBar
       
    }

}
