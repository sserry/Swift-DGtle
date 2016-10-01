//
//  SDGViewControllerEmptyVisible.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/2.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol SDGViewControllerEmptyVisible: class {
    
    var emptyDataType: SDGEmptyDataType { get }
    var targetTableView: UITableView { get }
    
}

extension SDGViewControllerEmptyVisible where Self: UIViewController,
                                              Self: UITableViewDelegate,
                                              Self: UITableViewDataSource {
    
    var emptyDataView: SDGMsgEmptyDataView {
        get {
            return SDGMsgEmptyDataView(with: emptyDataType, frame: targetTableView.bounds)
        }
    }
    
    func configureEmptyDataView() {
        if targetTableView.delegate == nil { targetTableView.delegate = self }
        if targetTableView.dataSource == nil { targetTableView.dataSource = self }
        view.addSubview(targetTableView)
        targetTableView.addSubview(emptyDataView)
    }
}
