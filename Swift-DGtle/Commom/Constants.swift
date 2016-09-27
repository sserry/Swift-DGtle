//
//  Constants.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh

let SCREEN_WIDTH                            = UIScreen.main.bounds.width
let SCREEN_HEIGHT                           = UIScreen.main.bounds.height
let SCREEN_SIZE                             = UIScreen.main.bounds
let RESIZE_FACTOR                           = SCREEN_WIDTH / 375.0

let SINGLE_LINE_WIDTH                       = 1 / UIScreen.main.scale
let NAV_BAR_H: CGFloat                      = 64.0
let TAB_BAR_H: CGFloat                      = 50.0
let DEFAULT_CELL_HEIGHT: CGFloat            = 44.0
let DEFAULT_TABLE_VIEW_HEADER_H: CGFloat    = 14

let SDGBlue                                 = UIColor.colorWithHexString("3579f6")
let GLOBAL_GRAY_LIGHT                       = UIColor.colorWithHexString("f1f1f3")
let SINGLE_LINE_COLOR                       = UIColor.colorWithHexString("cccccc")
let DEEP_TEXT_GRAY                          = UIColor.colorWithHexString("333333")
let TEXT_GRAY                               = UIColor.colorWithHexString("515151")
let LIGHT_TEXT_GRAY                         = UIColor.colorWithHexString("999999")

public func delayExcute( _ block: @escaping () -> () ) {
    let time = DispatchTime.now() + Double(Int64(1.2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: time) {
        block()
    }

}
