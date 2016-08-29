//
//  SDGTableView.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

@objc protocol SDGTableViewDelegate {
    func refreshTableView(tableView: SDGTableView)
    optional func tableViewLoadMore()
}

class SDGTableView: UITableView {

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        backgroundColor = GLOBAL_GRAY_LIGHT
        tableFooterView = UIView()
        
        let refreshHeader = SDGRereshHeader(refreshingTarget: self, refreshingAction: #selector(SDGTableView.tableViewDidRefreshed(_:)))
        
        mj_header = refreshHeader
        
    }
    
    convenience init(frame: CGRect, aDelegete: UITableViewDelegate, aDataSource: UITableViewDataSource) {
        self.init(frame: frame, style: .Grouped)
        self.delegate = aDelegete
        self.dataSource = aDataSource
    }
    
}

extension SDGTableView {
    
    func tableViewDidRefreshed(sender: SDGRereshHeader) {
        
        if let dlg = delegate as? SDGTableViewDelegate {
            dlg.refreshTableView(self)
        } 
    }
    
}
