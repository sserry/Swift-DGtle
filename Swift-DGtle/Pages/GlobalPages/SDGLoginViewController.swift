//
//  SDGLoginViewController.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/2.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGLoginViewController: SDGBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBarTransparent()
        navigationItem.leftBarButtonItem = UIBarButtonItem.barBtnItemWithNmlImg(UIImage(named: "nav_back_white"),
                                                                                selImg: UIImage(named: "nav_back_white"),
                                                                                target: self, action: #selector(UIViewController.dismissCurrentNavigation))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.gg_reset()
    }

}
