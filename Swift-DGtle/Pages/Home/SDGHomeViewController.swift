//
//  SDGHomeViewController.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import SDCycleScrollView

class SDGHomeViewController: SDGBaseViewController, SDGRouteProtocol {
    
    var banners: [JSON]? {
        didSet {
            let bannerInfoTuple: [(String, String)] = banners!.map {
                return ($0["title"].stringValue, $0["pic_url"].stringValue)
            }
            banner.bannerScrollView.imageURLStringsGroup = bannerInfoTuple.map { $0.1 }
            banner.titles = bannerInfoTuple.map { $0.0 }
            
            if banner.bannerTextLabel.text == nil
               || banner.bannerTextLabel.text == "" {
                banner.bannerTextLabel.text = banner.titles?[0]
            }
            
        }
    }
    
    var articleList: [JSON]? {
        didSet {
            guard articleList != nil else { return }
            // 排序
            articleList = articleList?.sorted {
                $0["aid"].intValue > $1["aid"].intValue
            }
            mainTableView?.reloadData()
        }
    }
    
    var sortedIndex: [String]?
    
    var banner: SDGHomeTableHeader!
    
    weak var mainTableView: SDGTableView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNavigationBar()
        
        setTableView()
        
        mainTableView?.mj_header.beginRefreshing()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        let tableView = SDGTableView(frame: view.frame, aDelegete: self)
        mainTableView = tableView
        view.addSubview(mainTableView!)
        mainTableView!.frame = self.view.bounds
        mainTableView?.register(UINib(nibName: "SDGHomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SDGHomeTableViewCell.cellReuseIdentifier)
        
        banner = SDGHomeTableHeader(scrollViewDelegate: self)
        
        mainTableView?.tableHeaderView = banner
    }
    
    // -- 获取文章列表
    func getListData(_ completion: ( () -> Void)? ) {
        
        let param = ["inapi": "yes",
                     "limit": "0_20",
                     "modules": "portal",
                     "order": "dateline_desc"]
        
        SDGAPI.HOMEPAGE_ARTICLE.httpOperation(with: param, hud: nil, success: { [ weak self] data in
            
            completion?()
            
            let articlelist = data["returnData"]["articlelist"].dictionaryObject
            let jsonlist = articlelist?.map { return (JSON(rawValue: $1))! }
            
            self?.articleList = jsonlist
            
        }, failure: { err in
            
            completion?()
            
        })
    }
    
    // -- 获取Banner信息
    func getBannerData(_ completion: ( () -> Void)? ) {
        
        let param = ["bid": "274",
                     "inapi": "yes",
                     "modules": "portal"]
        
        SDGAPI.HOMEPAGE_BANNER.httpOperation(with: param, hud: nil, success: { [weak self] data in
            
            completion!()
            
             let blockList = data["returnData"]["blocklist"]
             self?.banners = blockList["274"].map { return $0.1 }
            
        }, failure: { err in
            
            completion!()
        
        })
    }

}

//MARK: Button Actions
extension SDGHomeViewController {
    
    func showSearchPage(_ sender: UIButton) {
        go(to: .goSetting)
    }
    
}


//MARK: Table view delegate
extension SDGHomeViewController: UITableViewDelegate, UITableViewDataSource, SDGTableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return SDGHomeTableViewCell.configureCellForTableView(tableView, aModelSource: articleList?[indexPath.section])
    }
    
    func refreshTableView(_ tableView: SDGTableView?, completion: ( () -> Void)?) {
        
        getBannerData { completion?() }
        
        getListData { completion?() }
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
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        banner.currentTitle = banner.titles?[index]
    }
    
}


