//
//  SDGGroupLeftChildViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupLeftChildViewController: SDGBaseViewController {
    
    var mainTable = SDGTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTable = SDGTableView(frame: CGRect(x: 0, y: 0, width: view.gg_w, height: view.gg_h), aDelegete: self)
        mainTable.contentInset = UIEdgeInsetsMake(NAV_BAR_H, 0, TAB_BAR_H, 0)
        mainTable.register(UINib(nibName: "SDGGroupTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SDGGroupTableViewCell.cellReuseIdentifier)
        view.addSubview(mainTable)
    }

}

extension SDGGroupLeftChildViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SDGGroupTableViewCell.configureCellForTableView(tableView, aModelSource: SDGGroupCellModel())
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 13
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
}

extension SDGGroupLeftChildViewController: SDGTableViewDelegate {
    func refreshTableView(_ tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
}
