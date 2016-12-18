//
//  HttpRequest.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation
import Alamofire

enum EnvApiHost {
    case ENV_DEV
    case ENV_PRE
    case ENV_PRD
}

struct HttpRequest {
    
    // MARK: -- JSON 解析
    static func decode(JSON string: String) -> AnyObject {
        let data = string.data(using: String.Encoding.utf8)
        let dic = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
        return dic as AnyObject
    }
    
    
    // MARK: -- 取消网络请求
    static func cancelRequest() {
        Alamofire.SessionManager.default.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
        }
    }
    
    
    // MARK: -- http 请求 -- 上传
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            formData: HttpFormDataClosure,
                            success: HttpRequestSuccessClosure,
                            failure: HttpRequestFailClosure,
                            progress: HttpProgressClosure)
    {
        if !APIEngine.sharedManager.isNetworkReachable { return }
        
        var urlString = formatURLString(with: env, apiPath: apiPath)
        
        let configuration = URLSessionConfiguration.default
        let header = SessionManager.defaultHTTPHeaders
        
        // TODO: -其余请求头的设置 还需要做一点围小的工作 请求头设置会有问题 手动生成manager 如果manager非默认的话无法进行请求
        //        header["Sign"] =
        //        header["Authorization"] =
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = SDGAPI.NET_REQUEST_TIMEOUT_INTERVAL
        configuration.httpAdditionalHeaders = header
        
        let manager = SessionManager(configuration: configuration)
        
        urlString = URL(string: urlString!)?.absoluteString
        
        /// TODO: 没写完
        manager.upload(multipartFormData: formData!, to: urlString!) { resp in
        
        }
    }
    
    // MARK: -- http 直接GET请求 -- 闭包回调
    static func httpRequest(with urlString: String!,
                            params: [String: String]?,
                            success: HttpRequestSuccessClosure,
                            failure: HttpRequestFailClosure)
    {
        if !APIEngine.sharedManager.isNetworkReachable { return }
        
        Alamofire.request(urlString, method: .get, parameters: params)
                 .validate()
                 .responseJSON { resp in
                    switch resp.result {
                    case .success(let data):
                        if let successCls = success {
                            successCls(JSON(data))
                        }
                        break
                    case .failure(let err):
                        if let failCls = failure {
                            failCls(err)
                        }
                        break
                    }
        }
    }
    
    // MARK: -- http 请求 -- 代理回调
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String]?,
                            delegateObj: AnyObject,
                            delegateHandler: Selector?)
    {
        httpRequest(in: env, reqMethod: reqMethod, apiPath: apiPath, params: params, delegateObj: delegateObj, delegateHandler: delegateHandler, success: nil, failure: nil)
    }
    
    // MARK: -- http 请求 -- 闭包回调
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String]?,
                            success: HttpRequestSuccessClosure,
                            failure: HttpRequestFailClosure)
    {
        httpRequest(in: env, reqMethod: reqMethod, apiPath: apiPath, params: params, delegateObj: nil, delegateHandler: nil, success: success, failure: failure)
    }
    
    // MARK: -- 内部方法
    fileprivate static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String]?,
                            delegateObj: AnyObject?,
                            delegateHandler: Selector?,
                            success: HttpRequestSuccessClosure,
                            failure: HttpRequestFailClosure)
    {
        // 你缩我网络状况滋不滋瓷HTTP请求 那我当然是滋瓷的
        if !APIEngine.sharedManager.isNetworkReachable { return }
        
        let actionName = params?[SDGAPI.APP_ACTION_NAME]
        let urlString = formatURLString(with: env, apiPath: apiPath)
        
        if !needToRequestFromServer(for: actionName) {
            // TODO: 不需要从服务器拉取的数据 给人一种yin点的感觉
            
        } else {
            
            
            #if DEBUG
            
                /// debug环境下的输出 与控制台谈笑风生
                print("\n************************************************************\n")
                print("*****    Request type: \(reqMethod)\n")
                print("*****    url:          \(urlString)\n")
                print("*****    params:       \(params)\n")
                print("\n************************************************************\n")
                
            #endif
            
            
            Alamofire.request(urlString!, method: reqMethod, parameters: params)
                .validate()
                .responseJSON
                { response in
                    switch response.result {
                    case .success(let data):
                        
                        /// 选择子里面的代理返回
                        if let object = delegateObj {
                             let _ = object.perform(delegateHandler!, with: data)
                        }
                        
                        /// 闭包返回
                        if let successClosure = success {
                            
                            let jsonData = JSON(data)
                            successClosure(jsonData)
                            
                        }
                        break
                    case .failure(let err):
                        
                        #if DEBUG
                        
                            print("\n! -------------------------------------------------------- !\n")
                            print("! -----     REQUEST ERROR: -- BEGIN -- \n")
                            print("! -----     \(err.localizedDescription)\n")
                            print("! -----     REQUEST ERROR: -- END -- \n")
                            print("\n! -------------------------------------------------------- !\n")
                            
                        #endif
                        
                        /// 选择子里面的代理返回
                        if let object = delegateObj {
                            let errStr = HttpRequest.errorString(with: err)
                            let _ = object.perform(delegateHandler!, with: errStr)
                        }
                        
                        /// 闭包返回
                        if let failClosure = failure {
                            failClosure(err as Error)
                        }
                        break
                    }
            }
            
        }
        
    }
    
}
