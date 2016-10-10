//
//  SDGBaseViewController.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/1.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.gg_reset()
    }

}
