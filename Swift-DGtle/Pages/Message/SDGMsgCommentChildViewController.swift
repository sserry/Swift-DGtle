//
//  SDGMsgCommentChildViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMsgCommentChildViewController: SDGBaseViewController, SDGViewControllerEmptyVisible {
    
    static let subviewFrame = CGRect(x: 0, y: NAV_BAR_H + 49, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - (NAV_BAR_H + 49 + TAB_BAR_H))

    let segBar = SDGSegmentButtonsView(with: CGRect(x: 0, y: NAV_BAR_H, width: SCREEN_WIDTH, height: 49))
    
    var targetTableView: UITableView = SDGTableView(frame: SDGMsgCommentChildViewController.subviewFrame, aDelegete: self as AnyObject)

    var emptyDataType: SDGEmptyDataType {
        return .comment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segBar.delegate = self
        view.addSubview(segBar)
        configureEmptyDataView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        targetTableView.mj_header.beginRefreshing()
    }

    
}

extension SDGMsgCommentChildViewController: SDGSegmentButtonsViewProtocol {
    
    func segmentBtnDidSelected(at index: Int) {
      
    }
    
}

extension SDGMsgCommentChildViewController: UITableViewDataSource, UITableViewDelegate {

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

extension SDGMsgCommentChildViewController: SDGTableViewDelegate {
    func refreshTableView(_ tableView: SDGTableView) {
        delayExcute { tableView.mj_header.endRefreshing() }
    }
}
