//
//  SDGGlobal.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/17.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation

struct HTTP_HEAD {
    
    static let KEY_WANTYPE         =   "wantype"
    static var VALUE_WANTYPE       =   "" // wifi, 3G
    
    static let KEY_APPVERSION      =   "AppVersion"
    static let KEY_FORMAT          =   "Format"
    static let KEY_DEVICETYPE      =   "mobileModel"
    static let KEY_SYSTEMNAME      =   "os"
    static let KEY_SYSTEMVERSION   =   "osVersion"
    static let KEY_SIGN            =   "Sign"
    static let KEY_UDID            =   "UDID"
    static let KEY_APPCHANNEL      =   "AppChanel"
    
    static let VALUE_APPVERSION    = APP_VERSION
    static let VALUE_FORMAT        = APP_FORMAT
    static let VALUE_SYSTEMNAME    = AppUtitls.systemName
    static let VALUE_APPCHANNEL    = APP_CHANNEL_ID
    static var VALUE_DEVICETYPE    = AppUtitls.modelInfo
    static var VALUE_SYSTEMVERSION = AppUtitls.systemVersion
    static var VALUE_SIGN          = ""
    static var VALUE_UDID          = AppUtitls.UDID
    
}

class SDGGlobal {
    
    static let shared = SDGGlobal()
    
    var networkOK: Bool = true
    
    var httpCommonParams: [String: String] = [HTTP_HEAD.KEY_APPVERSION   : HTTP_HEAD.VALUE_APPVERSION,
                                              HTTP_HEAD.KEY_FORMAT       : HTTP_HEAD.VALUE_FORMAT,
                                              HTTP_HEAD.KEY_APPCHANNEL   : HTTP_HEAD.VALUE_APPCHANNEL,
                                              HTTP_HEAD.KEY_DEVICETYPE   : HTTP_HEAD.VALUE_DEVICETYPE,
                                              HTTP_HEAD.KEY_SYSTEMVERSION: HTTP_HEAD.VALUE_SYSTEMVERSION,
                                              HTTP_HEAD.KEY_SYSTEMNAME   : HTTP_HEAD.VALUE_SYSTEMNAME,
                                              HTTP_HEAD.KEY_UDID         : HTTP_HEAD.VALUE_UDID]
}
