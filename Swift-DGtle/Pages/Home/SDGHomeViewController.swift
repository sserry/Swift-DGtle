//
//  SDGHomeViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import SDCycleScrollView

class SDGHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        setNavigationBar()
        
        setTableView()
    }
    
    func setNavigationBar() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "nav_logo"))
        let searchItem = UIBarButtonItem.barBtnItemWithNmlImg(UIImage(named: "home_search_icon"),
                                                              selImg: UIImage(named: "home_search_icon"),
                                                              target: self,
                                                              action: #selector(SDGHomeViewController.showSearchPage(_:)))
        navigationItem.rightBarButtonItem = searchItem
    }
    
    func setTableView() {
        
        let mainTableView = SDGTableView(frame: view.frame, aDelegete: self)
        view.addSubview(mainTableView)
        mainTableView.snp_makeConstraints { $0.edges.equalToSuperview() }
        mainTableView.register(UINib(nibName: "SDGHomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SDGHomeTableViewCell.cellReuseIdentifier)
        
        let tableHeader = SDGHomeTableHeader(
            imageUrls: ["http://img.dgtle.com/portal/201608/26/103326xgll4l4nl12l1z2j.png",
            "http://img.dgtle.com/portal/201608/25/161703tad5ak4k1akkgay5.png",
            "http://img.dgtle.com/portal/201608/24/180630xpyxap60tiy232z9.png",
            "http://img.dgtle.com/portal/201608/26/163316w077qq9cqcq9cef3.png",
            "http://img.dgtle.com/portal/201608/27/093533sgrgrjtge7la8j09.jpg"],
            scrollViewDelegate: self)
        
        mainTableView.tableHeaderView = tableHeader
    }

}

//MARK: Button Actions
extension SDGHomeViewController {
    
    func showSearchPage(_ sender: UIButton) {
    
    }
    
}


//MARK: Table view delegate
extension SDGHomeViewController: UITableViewDelegate, UITableViewDataSource, SDGTableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SDGHomeTableViewCell.configureCellForTableView(tableView, aModelSource: HomeArticalModel())
    }
    
    func refreshTableView(_ tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return DEFAULT_TABLE_VIEW_HEADER_H
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

//MARK: SDCycleScrollViewDelegate
extension SDGHomeViewController: SDCycleScrollViewDelegate {

    
}


