//
//  SDGGroupViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        let buttonsBar = ButtonsBar(frame: CGRectMake(0, 0, 180, 44), titlesArray: ["精选", "发现"], buttonMargin: 84)
        navigationItem.titleView = buttonsBar
    }

    
}
