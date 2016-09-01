//
//  SDGGroupLeftChildViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupLeftChildViewController: UIViewController {
    
    var mainTable = SDGTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        mainTable = SDGTableView(frame: CGRectMake(0, 0, view.gg_w, view.gg_h), aDelegete: self)
        mainTable.contentInset = UIEdgeInsetsMake(NAV_BAR_H, 0, TAB_BAR_H, 0)
        mainTable.registerNib(UINib(nibName: "SDGGroupTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: SDGGroupTableViewCell.cellReuseIdentifier)
        view.addSubview(mainTable)
    }

}

extension SDGGroupLeftChildViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return SDGGroupTableViewCell.configureCellForTableView(tableView, aModelSource: SDGGroupCellModel())
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
}

extension SDGGroupLeftChildViewController: SDGTableViewDelegate {
    func refreshTableView(tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
}
