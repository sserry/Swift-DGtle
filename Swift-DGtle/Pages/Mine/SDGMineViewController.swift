//
//  SDGMineViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGMineViewController: SDGBaseViewController, SDGRouteProtocol {

    var userMenuTable: SDGZoomHeaderTableView?
    let iconNameArr = [ "article_new", "collection_new", "setting_draft_new", "download_new", "forum", "ic_loyalty"]
    let cellTitleArr = ["我的帖子", "我的收藏", "草稿箱", "离线下载", "旧版社区", "甩甩尾巴" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        setNeedsStatusBarAppearanceUpdate()
        setMenuTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        

    }
    
    func setNavigationBar() {
        //触发状态栏上面的字变白
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBarTransparent()
        navigationItem.rightBarButtonItem = UIBarButtonItem.barBtnItemWithNmlImg(UIImage(named: "settings_new"),
                                                                                 selImg: UIImage(named: "settings_new"),
                                                                                 target: self,
                                                                                 action: #selector(SDGMineViewController.settingBtnClicked(_:)))
    }
    
    func setMenuTable() {
        let header = UIImageView(image: UIImage(named: "userBg"))
        let winH = 181 * RESIZE_FACTOR
        header.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: winH)
        userMenuTable = SDGZoomHeaderTableView(zoomingHeader: header, windowSize: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: winH))
        userMenuTable?.register(UINib(nibName: "SDGUserTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SDGUserTableViewCell.cellReuseIdentifier)
        userMenuTable?.delegate = self
        userMenuTable?.dataSource = self
        view.addSubview(userMenuTable!)
        userMenuTable?.snp.makeConstraints { $0.edges.equalToSuperview() }
        userMenuTable?.tableHeaderView = SDGUserUnloginHeader(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: winH)) { [unowned self] in
            self.go(to: .goLogin)
        }
    }


}

extension SDGMineViewController {

    func settingBtnClicked(_ sender: UIButton ) {
        go(to: .goSetting)
    }
}

extension SDGMineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = SDGUserCellSettingModel(iconName: iconNameArr[(indexPath as NSIndexPath).row], title: cellTitleArr[(indexPath as NSIndexPath).row])
        return SDGUserTableViewCell.configureCellForTableView(tableView, aModelSource: model)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: UIView = {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.gg_w, height: 20))
            header.backgroundColor = UIColor.colorWithHexString(stringToConvert: "CCCCCC")
            return header
        }()
        
        return header
    }
}

extension SDGMineViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0 {
            scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x, y: 0), animated: false)
            return
        }
        let scale = max(1 + (-offsetY) / 170, 1)
        userMenuTable?.zoomingHeaderforScale(scale)
    }
}
