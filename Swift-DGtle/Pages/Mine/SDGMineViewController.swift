//
//  SDGMineViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMineViewController: UIViewController {

    var userMenuTable: SDGZoomHeaderTableView?
    let iconNameArr = [ "article_new", "collection_new", "setting_draft_new", "download_new", "forum", "ic_loyalty"]
    let cellTitleArr = ["我的帖子", "我的收藏", "草稿箱", "离线下载", "旧版社区", "甩甩尾巴" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GLOBAL_GRAY_LIGHT
        
        automaticallyAdjustsScrollViewInsets = false
        
        setNavigationBar()
        
        setMenuTable()
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.setBarTransparent()
        navigationItem.rightBarButtonItem = UIBarButtonItem.barBtnItemWithNmlImg(UIImage(named: "settings_new"),
                                                                                 selImg: UIImage(named: "settings_new"),
                                                                                 target: self,
                                                                                 action: #selector(SDGMineViewController.settingBtnClicked(_:)))
    }
    
    func setMenuTable() {
        let header = UIImageView(image: UIImage(named: "userBg"))
        let winH = 181 * RESIZE_FACTOR
        header.frame = CGRectMake(0, 0, SCREEN_WIDTH, winH)
        userMenuTable = SDGZoomHeaderTableView(zoomingHeader: header, windowSize: CGRectMake(0, 0, SCREEN_WIDTH, winH))
        userMenuTable?.registerNib(UINib(nibName: "SDGUserTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: SDGUserTableViewCell.cellReuseIdentifier)
        userMenuTable?.delegate = self
        userMenuTable?.dataSource = self
        view.addSubview(userMenuTable!)
        userMenuTable?.snp_makeConstraints { $0.edges.equalToSuperview() }
        userMenuTable?.tableHeaderView = SDGUserUnloginHeader(frame: CGRectMake(0, 0, SCREEN_WIDTH, winH))
    }


}

extension SDGMineViewController {

    func settingBtnClicked(sender: UIButton ) {
    
    }
}

extension SDGMineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model = SDGUserCellSettingModel(iconName: iconNameArr[indexPath.row], title: cellTitleArr[indexPath.row])
        return SDGUserTableViewCell.configureCellForTableView(tableView, aModelSource: model)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: UIView = {
            let header = UIView(frame: CGRectMake(0, 0, view.gg_w, 20))
            header.backgroundColor = UIColor.colorWithHexString("CCCCCC")
            return header
        }()
        
        return header
    }
}

extension SDGMineViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0 {
            scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, 0), animated: false)
            return
        }
        let scale = max(1 + (-offsetY) / 170, 1)
        userMenuTable?.zoomingHeaderforScale(scale)
    }
}
