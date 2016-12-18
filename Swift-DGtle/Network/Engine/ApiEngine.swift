//
//  ApiEngine.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire

struct APIEngine {
    
    // 网络状况
    var isNetworkReachable: Bool = true
    
    static let sharedManager = APIEngine()
    
    
    /// 默认请求方式 -- 代理回调
    ///
    /// - Parameters:
    ///   - env: 环境
    ///   - reqMethod: 方法
    ///   - api: api字段
    ///   - params: 参数字典
    ///   - hud: 弹窗
    ///   - delegate: 回调代理
    public func engineDefault(_ env: EnvApiHost,
                       reqMethod: HTTPMethod,
                       api: String,
                       params: [String: String],
                       hud: SVProgressHUD?,
                       delegate: RequestAnswerable )
    {
        
        let task = RequestGenerator(env, api: api, params: params, delegate: delegate, method: reqMethod)
        task.hudApi = hud
        
        task.beginRequest()
    }
    
    
    /// 默认请求方式 -- 代理回调 （用于同一页面，发送同一请求，只在不同时候用到）
    ///
    /// - Parameters:
    ///   - env: 环境
    ///   - reqMethod: 方法
    ///   - api: api字段
    ///   - params: 参数字典
    ///   - hud: 弹窗
    ///   - delegate: 回调代理
    ///   - apiFlag: api 标示
    public func engineDefault(_ env: EnvApiHost,
                       reqMethod: HTTPMethod,
                       api: String,
                       params: [String: String],
                       hud: SVProgressHUD?,
                       delegate: RequestAnswerable ,
                       apiFlag: String)
    {
        
        let task = RequestGenerator(env, api: api, params: params, delegate: delegate, method: reqMethod)
        task.hudApi = hud
        task.flagCommonApi = apiFlag
        
        task.beginRequest()
    }
    
    
    /// 默认请求方式 -- 闭包回调
    ///
    /// - Parameters:
    ///   - env: 环境
    ///   - reqMethod: 方法
    ///   - api: api字段
    ///   - params: 参数字典
    ///   - success: 成功回调
    ///   - failure: 失败回调
    public func engineDefault(_ env: EnvApiHost,
                       reqMethod: HTTPMethod,
                       api: String,
                       params: [String: String],
                       success: HttpRequestSuccessClosure,
                       failure: HttpRequestFailClosure)
    {
        
        HttpRequest.httpRequest(in: env,
                                reqMethod: reqMethod,
                                apiPath: api,
                                params: params,
                                success: success,
                                failure: failure)
    }
    
    
    
    /// 资源上传
    ///
    /// - Parameters:
    ///   - env: 环境
    ///   - reqMethod: 请求方式
    ///   - api: api字段
    ///   - formData: 上传多类型数据的闭包
    ///   - success: 成功回调闭包
    ///   - failure: 失败回调闭包
    ///   - progress: 进度回调闭包
    public func engineForResource(_ env: EnvApiHost,
                           reqMethod: HTTPMethod,
                           api: String,
                           formData: HttpFormDataClosure,
                           success: HttpRequestSuccessClosure,
                           failure: HttpRequestFailClosure,
                           progress: HttpProgressClosure)
    {
        HttpRequest.httpRequest(in: env,
                                reqMethod: reqMethod,
                                apiPath: api,
                                formData: formData,
                                success: success,
                                failure: failure,
                                progress: progress)
    }
    
}
