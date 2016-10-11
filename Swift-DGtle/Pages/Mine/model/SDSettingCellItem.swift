//
//  SDSettingCellItem.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/10.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation

struct SDSettingCellItem {
    var title: String
    var content: String?
    var mode: SDGSettingCellMode
    var isHead: Bool
    var isTail: Bool
    var targetVC: SDGBaseViewController
}
