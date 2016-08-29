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

let SCREEN_WIDTH                            = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT                           = UIScreen.mainScreen().bounds.height
let SCREEN_SIZE                             = UIScreen.mainScreen().bounds
let RESIZE_FACTOR                           = SCREEN_WIDTH / 375.0

let SINGLE_LINE_WIDTH                       = 1 / UIScreen.mainScreen().scale
let NAV_BAR_H: CGFloat                      = 64.0
let DEFAULT_CELL_HEIGHT: CGFloat            = 44.0
let DEFAULT_TABLE_VIEW_HEADER_H: CGFloat    = 14

let SDGBlue                                 = UIColor.colorWithHexString("3579f6")
let GLOBAL_GRAY_LIGHT                       = UIColor.colorWithHexString("f1f1f3")
let SINGLE_LINE_COLOR                       = UIColor.colorWithHexString("cccccc")
let DEEP_TEXT_GRAY                          = UIColor.colorWithHexString("333333")
let TEXT_GRAY                               = UIColor.colorWithHexString("515151")
let LIGHT_TEXT_GRAY                         = UIColor.colorWithHexString("999999")

public func delayExcute( block: () -> () ) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(1.2 * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue()) {
        block()
    }

}