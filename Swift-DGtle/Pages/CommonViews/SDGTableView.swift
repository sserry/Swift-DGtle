//
//  SDGTableView.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

@objc protocol SDGTableViewDelegate {
    func refreshTableView(_ tableView: SDGTableView?,  completion: ( () -> Void)?)
    @objc optional func tableViewLoadMore(completion: (_ noMore: Bool) -> Void)
}

class SDGTableView: UITableView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = GLOBAL_GRAY_LIGHT
        tableFooterView = UIView()
        showsVerticalScrollIndicator = false

    }
    
    convenience init(frame: CGRect, aDelegete: AnyObject) {
        self.init(frame: frame, style: .grouped)
        
        if let dlg = aDelegete as? UITableViewDelegate,
            let dsc = aDelegete as? UITableViewDataSource {
            self.delegate = dlg
            self.dataSource = dsc
        }
        let refreshHeader = SDGRefreshHeader(refreshingTarget: self, refreshingAction: #selector(SDGTableView.tableViewDidRefreshed(_:)))
        
        mj_header = refreshHeader

    }
    
}

extension SDGTableView {
    
    func tableViewDidRefreshed(_ sender: SDGRefreshHeader) {
        
         if let dlg = delegate as? SDGTableViewDelegate {
            
            // weak var weakSelf = self
             dlg.refreshTableView(self) {
                 sender.endRefreshing()
                //self?.mj_header.endRefreshing()
            }
         }
    }
    
}
