//
//  SDGApi.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation
import Alamofire

let APIREQTYPE                                              = "REQTYPE"
let APINAME                                                 = "APINAME"
let APIENV                                                  = "ENV"
let REQUESTCODE                                             = "REQUESTCODE"
let ACTIONS                                                 = "actions"

struct SDGAPI {
    
    // MARK: -- common configurations --
    static let HOST_URL                                     = "www.dgtle.com/api/dgtle_api/v1/api.php"
    
    // 猜测是存放图片等资源的服务器
    static let UC_SERVER_HOST_URL                           = "http://www.dgtle.com/uc_server/data"
    
    // 头像资源的主路径
    /*
    是以一种树形的结构存储的 将六位用户id（uid）若不足六位则在首位添0补足 截成3级
    有三种尺寸
    长宽分别不大于 48 120 200
    最后资源的格式为： [uid末两位]_avatar_[big/small/middle].jpg
    eg: uid: 91111
        url: http://www.dgtle.com/uc_server/data/avatar/000/09/11/11_avatar_big.jpg
    */
    static let AVATAR_HOST_URL                              = "http://www.dgtle.com/uc_server/data/avatar/000"
    static let APP_ACTION_NAME                              = "APP_ACTION_NAME"
    static let NET_REQUEST_TIMEOUT_INTERVAL: TimeInterval   = 30
    
    // MARK: -- APIs -- 数字尾巴的API是没有API地址的 行为在参数字典的 action 或者 REQUESTCODE 字段中 ///
    
    // @ --- 启动时调用的API --- @
    
    // -- 所有论坛分类
    static let INDEX                                        = [APIREQTYPE: "GET", ACTIONS: "index"]
    
    // -- 各个论坛信息 参数是 fid (forumId?) 
    //    已知的 fid = 60 是应用控, fid = 63 是资讯
    static let FORUMDISPLAY                                 = [APIREQTYPE: "GET", ACTIONS: "forumdisplay"]
    
    // -- 今日尾巴壁纸 共六个尺寸
    static let SPIC                                         = [APIREQTYPE: "GET", ACTIONS: "spic"]
    
    // -- 标签分类列表
    static let GETCATEGORY                                  = [APIREQTYPE: "GET", ACTIONS: "getcategory"]
    
    // -- 猜测是一个重要信息的接口 可能是开启首页时的弹窗
    static let HIGHLIGHT_INFO                               = [APIREQTYPE: "GET", REQUESTCODE: "18"]
    
    // @ --- 首页API --- @
    
    // -- 首页文章列表
    static let HOMEPAGE_ARTICLE                             = [APIREQTYPE: "GET", ACTIONS: "article"]
    
    // -- 首页Banner信息
    static let HOMEPAGE_BANNER                              = [APIREQTYPE: "GET", ACTIONS: "diydata"]
    
    // @ --- 小组API --- @
    
    // -- 小组精选
    static let GROUP_HOTEST                                 = [APIREQTYPE: "GET", REQUESTCODE: "46"]
    
    // -- 小组发现
    static let GROUP_ALL                                    = [APIREQTYPE: "GET", REQUESTCODE: "42"]
    
    // -- 小组
    static let GROUP_HOTLIST                                = [APIREQTYPE: "GET", REQUESTCODE: "62"]
    
    // -- 小组Banner信息
    static let GROUP_BANNER                                 = [APIREQTYPE: "GET", REQUESTCODE: "49"]
    
}

struct HEADER_PARAM {
    static let APIKEYS                                      = "DGTLECOM_APITEST1"
    static let CHARSET                                      = "UTF8"
    static let DATAFORM                                     = "json"
    static let PLATFORM                                     = "ios"
    static let SWH                                          = "480x800"
    static let VERSION                                      = "3.1.5 "
    static let `default`                                    = ["apikeys"    :   APIKEYS,
                                                               "charset"    :   CHARSET,
                                                               "dataform"   :  DATAFORM,
                                                               "platform"   :  PLATFORM,
                                                               "swh"        :       SWH,
                                                               "version"    :   VERSION]
}
