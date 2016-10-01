//
//  SDGMsgPrivateChildViewControlle.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMsgPrivateChildViewController: SDGBaseViewController, SDGViewControllerEmptyVisible {

    var emptyDataType: SDGEmptyDataType {
        return .message
    }
    
    var targetTableView: UITableView = SDGTableView(frame: BOUNDS_WITHOUT_NAV_TAB, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEmptyDataView()
    }

}

extension SDGMsgPrivateChildViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

extension SDGMsgPrivateChildViewController: SDGTableViewDelegate {
    func refreshTableView(_ tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
}

