//
//  SDGGroupRightChildViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import SDCycleScrollView


class SDGGroupRightChildViewController: SDGBaseViewController, SDGRouteProtocol {
    
    var mainTable = SDGTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable = SDGTableView(frame: CGRect(x: 0, y: 0, width: view.gg_w, height: view.gg_h), aDelegete: self)
        mainTable.contentInset = UIEdgeInsetsMake(NAV_BAR_H, 0, TAB_BAR_H, 0)
        mainTable.register(UINib(nibName: "SDGGroupTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SDGGroupTableViewCell.cellReuseIdentifier)
        mainTable.register(SDGroupShowMoreCell.self, forCellReuseIdentifier: SDGroupShowMoreCell.cellReuseIdentifier)
        
        view.addSubview(mainTable)
        
        let tableHeader = SDGHomeTableHeader(
            imageUrls: ["http://img.dgtle.com/portal/201608/26/103326xgll4l4nl12l1z2j.png",
                "http://img.dgtle.com/portal/201608/25/161703tad5ak4k1akkgay5.png",
                "http://img.dgtle.com/portal/201608/24/180630xpyxap60tiy232z9.png",
                "http://img.dgtle.com/portal/201608/26/163316w077qq9cqcq9cef3.png",
                "http://img.dgtle.com/portal/201608/27/093533sgrgrjtge7la8j09.jpg"],
            scrollViewDelegate: self)
        
        mainTable.tableHeaderView = tableHeader
    }

}


extension SDGGroupRightChildViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.section == 0
               ? SDGroupShowMoreCell.configureCellForTableView(tableView, aModelSource: self)
               : SDGGroupTableViewCell.configureCellForTableView(tableView, aModelSource: SDGGroupCellModel())
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 || section == 1
               ? 0.01
               : 13
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? SDGroupShowMoreCell.kCellH : 330
    }
}

extension SDGGroupRightChildViewController: SDGTableViewDelegate {
    func refreshTableView(_ tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
}

extension SDGGroupRightChildViewController: SDCycleScrollViewDelegate {
    
}
