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
    
    static func decode(JSON string: String) -> AnyObject {
        let data = string.data(using: String.Encoding.utf8)
        let dic = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
        return dic as AnyObject
    }
    
    
    /// 取消网络请求
    static func cancelRequest() {
        Alamofire.SessionManager.default.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
        }
    }
    
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String],
                            delegateObj: RequestAnswerable,
                            delegateHandler: Selector)
    {
        httpRequest(in: env, reqMethod: reqMethod, apiPath: apiPath, params: params, delegateObj: delegateObj, delegateHandler: delegateHandler, success: nil, failure: nil)
    }
    
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String],
                            success: @escaping HttpRequestSuccessClosure,
                            failure: @escaping HttpRequestFailClosure)
    {
        httpRequest(in: env, reqMethod: reqMethod, apiPath: apiPath, params: params, delegateObj: nil, delegateHandler: nil, success: success, failure: failure)
    }
    
    static func httpRequest(`in` env: EnvApiHost,
                            reqMethod: HTTPMethod,
                            apiPath: String,
                            params: [String: String],
                            formData: HttpFormDataClosure,
                            success: HttpRequestSuccessClosure,
                            failure: HttpRequestFailClosure,
                            progress: HttpProgressClosure)
    {
        
    }
    
    fileprivate static func httpRequest(`in` env: EnvApiHost,
                                        reqMethod: HTTPMethod,
                                        apiPath: String,
                                        params: [String: String],
                                        delegateObj: RequestAnswerable?,
                                        delegateHandler: Selector?,
                                        success: HttpRequestSuccessClosure?,
                                        failure: HttpRequestFailClosure?)
    {
        
    }
    
}




