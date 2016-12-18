//
//  Dictionary+APIHandler.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

typealias HttpRequestSuccessClosure = ((JSON) -> Void)?
typealias HttpRequestFailClosure    = ((Error) -> Void)?
typealias HttpFormDataClosure       = ((MultipartFormData) -> Void)?
typealias HttpProgressClosure       = (CGFloat) -> Void?

import UIKit
import SVProgressHUD
import Alamofire

extension Dictionary {

    
    /// 代理回调
    ///
    /// - Parameters:
    ///   - param: params
    ///   - hud: hud
    ///   - delegate: delegate
    func httpOperation(with param: [String: String], hud: SVProgressHUD?, delegate: RequestAnswerable) {
        
        APIEngine.sharedManager.engineDefault(env,
                                              reqMethod: requestMethod,
                                              api: api,
                                              params: readyParams(param),
                                              hud: hud,
                                              delegate: delegate)
    }
    
    
    /// 代理回调 -- 是否同一页面请求
    ///
    /// - Parameters:
    ///   - param: param
    ///   - hud: hud
    ///   - delegate: delegate
    ///   - apiFlag: apiFlag
    func httpOperation(with param: [String: String], hud: SVProgressHUD?, delegate: RequestAnswerable, apiFlag: String) {
        
        // TODO: HUD Handler
        
        APIEngine.sharedManager.engineDefault(env,
                                              reqMethod: requestMethod,
                                              api: api,
                                              params: readyParams(param),
                                              hud: hud,
                                              delegate: delegate,
                                              apiFlag: apiFlag)
    }
    
    
    /// 闭包回调
    ///
    /// - Parameters:
    ///   - param: param
    ///   - hud: hud
    ///   - success: 成功回调闭包
    ///   - failure: 失败回调闭包
    func httpOperation(with param: [String: String], hud: SVProgressHUD?,
                       success: HttpRequestSuccessClosure,
                       failure: HttpRequestFailClosure) {
        
        APIEngine.sharedManager.engineDefault(env,
                                              reqMethod: requestMethod,
                                              api: api,
                                              params: readyParams(param),
                                              success: { obj in
                                                //TODO: hud handler
                                                if success != nil {
                                                    success!(obj)
                                                }
                                              },
                                              failure: { err in
                                                //TODO: hud handler
                                                if failure != nil {
                                                    failure!(err)
                                                }
                                              })
        
    }
    
    
    
    /// 资源上传
    ///
    /// - Parameters:
    ///   - param: param
    ///   - hud: hud
    ///   - formData: 生成formData闭包
    ///   - success: 成功回调闭包
    ///   - failure: 失败回调闭包
    ///   - progressClosure: 进度闭包
    func httpOperation(with param: [String: String], hud: SVProgressHUD?,
                       formData: HttpFormDataClosure,
                       success: HttpRequestSuccessClosure,
                       failure: HttpRequestFailClosure,
                       progressClosure: HttpProgressClosure ) {
        
        // TODO: HUD Handler
        
        APIEngine.sharedManager.engineForResource(env,
                                                  reqMethod: requestMethod,
                                                  api: api,
                                                  formData: formData,
                                                  success:  { obj in
                                                    //TODO: hud handler
                                                    if success != nil {
                                                        success!(obj)
                                                    }
                                                  }, failure:  { err in
                                                    //TODO: hud handler
                                                    if failure != nil {
                                                        failure!(err)
                                                    }
                                                  }, progress: progressClosure)
        
    }

    
//    var api: String {
//        let key = APINAME as! Key
//        return self[key] as! String
//    }
    
    func readyParams(_ param: [String: String]) -> [String: String] {
        var params = param
        
        // 拼接行为字段
        if self[ACTIONS as! Key] != nil {
            params[ACTIONS] = self[ACTIONS as! Key] as? String
        } else if self[REQUESTCODE as! Key] != nil {
            params[REQUESTCODE] = self[REQUESTCODE as! Key] as? String
        }
        
        if let actions = self[ACTIONS as! Key] {
            params[ACTIONS] = actions as? String
        }
        
        // 拼接默认请求头参数
        for (key, value) in HEADER_PARAM.default {
            params[key] = value
        }
        
        
        return params
    }
    
    var api: String {
        return ""
    }
    
    var requestMethod: HTTPMethod {
        let key = APIREQTYPE
        return HTTPMethod(rawValue: self[key as! Key] as! String)!
    }
    
//    var env: EnvApiHost {
//        let key = APIENV as! Key
//        return self[key] as! EnvApiHost
//    }
    
    // hard coding
    var env: EnvApiHost {
        return .ENV_DEV
    }
    
    
    
}

