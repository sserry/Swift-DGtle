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
let BOUNDS_WITHOUT_NAV                      = CGRect(x: 0, y: NAV_BAR_H, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAV_BAR_H)
let BOUNDS_WITHOUT_NAV_TAB                  = CGRect(x: 0, y: NAV_BAR_H, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAV_BAR_H - TAB_BAR_H)
let RESIZE_FACTOR                           = SCREEN_WIDTH / 375.0

let SINGLE_LINE_WIDTH                       = 1 / UIScreen.main.scale

let NAV_BAR_H: CGFloat                      = 64.0
let TAB_BAR_H: CGFloat                      = 50.0
let DEFAULT_CELL_HEIGHT: CGFloat            = 44.0
let DEFAULT_TABLE_VIEW_HEADER_H: CGFloat    = 14

let SDGBlue                                 = UIColor.colorWithHexString(stringToConvert: "35A3F6")
let GLOBAL_GRAY_LIGHT                       = UIColor.colorWithHexString(stringToConvert: "f1f1f3")
let SINGLE_LINE_COLOR                       = UIColor.colorWithHexString(stringToConvert: "cccccc")
let DEEP_TEXT_GRAY                          = UIColor.colorWithHexString(stringToConvert: "333333")
let TEXT_GRAY                               = UIColor.colorWithHexString(stringToConvert: "515151")
let LIGHT_TEXT_GRAY                         = UIColor.colorWithHexString(stringToConvert: "999999")

public func delayExcute( _ block: @escaping () -> () ) {
    let time = DispatchTime.now() + Double(Int64(1.2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: time) {
        block()
    }

}

var currentNavigationController: SDGNavigationController? {
    get {
        if let ad     = UIApplication.shared.delegate as? AppDelegate,
           let curTC  = ad.window?.rootViewController as? SDGTabController,
           let curNVC = curTC.selectedViewController  as? SDGNavigationController {
            return curNVC
        }
        return nil
    }
}
