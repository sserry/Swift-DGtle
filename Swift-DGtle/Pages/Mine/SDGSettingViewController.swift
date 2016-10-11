//
//  SDGSettingViewController.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/9.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGSettingViewController: SDGBaseViewController {
    
    var settingTable: UITableView = {
        let table = UITableView(frame: SCREEN_SIZE, style: .grouped)
        table.backgroundColor = GLOBAL_GRAY_LIGHT
        table.register(UINib(nibName: "SDGSettingTableViewCell", bundle: nil), forCellReuseIdentifier: SDGSettingTableViewCell.cellReuseIdentifier)
        return table
    }()
    
    let settingItems: [SDSettingCellItem] = [SDSettingCellItem(title: "推送通知", content: nil, mode: .switch, isHead: true, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "省流量模式", content: nil, mode: .switch, isHead: false, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "文章字号", content: "默认", mode: .label, isHead: false, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "图片浏览", content: "自适应", mode: .label, isHead: false, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "稍后读", content: nil, mode: .label, isHead: false, isTail: true, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "邀请好友加入", content: nil, mode: .label, isHead: true, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "给个五星评价", content: nil, mode: .label, isHead: false, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "反馈建议", content: nil, mode: .label, isHead: false, isTail: false, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "清理缓存", content: "62.5 MB", mode: .label, isHead: false, isTail: true, targetVC: SDGBaseViewController()),
                                      SDSettingCellItem(title: "关于数字尾巴", content: nil, mode: .label, isHead: true, isTail: true, targetVC: SDGBaseViewController())]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "设置"
        settingTable.delegate = self
        settingTable.dataSource = self
        
        view.addSubview(settingTable)
    }

}

extension SDGSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 3 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 5
               : section == 1 ? 4
               : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transVal = indexPath.section == 0 ? 0
                     : indexPath.section == 1 ? 5
                     : 9
        return SDGSettingTableViewCell.configureCellForTableView(tableView, aModelSource: settingItems[indexPath.row + transVal])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return SDGSettingTableViewCell.cellHeight }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { return 0.01 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 16 }
    
}
