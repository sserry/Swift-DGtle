//
//  HttpRequest+Helper.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//


import Foundation
import Alamofire

extension HttpRequest {

    static func formatURLString(with host: EnvApiHost, apiPath: String!) -> String! {
        
        if apiPath.hasPrefix("http") { return apiPath }
        
        // TODO: 环境区分
        
//        switch host {
//        case .ENV_DEV:
//            break
//        default:
//            break
//        }
        
        let host = SDGAPI.HOST_URL
        let api: String! = apiPath
        
        var urlStr = "http://\(host)"
        
        guard api.characters.count > 0 else {
            return urlStr
        }
        
        if api.hasPrefix("/") {
            urlStr = "http://\(host)\(api)"
        } else {
            urlStr = "http://\(host)/\(api)"
        }
        
        return urlStr
        
    }
    
    static func httpMethodString(_ str: HTTPMethod) -> String! {
        var string = "GET"
        switch str {
        default:
            string = str.rawValue
        }
        return string
    }
    
    // TODO: 判断时候需要从服务器获取
    static func needToRequestFromServer(`for` api: String!) -> Bool {
        return true
    }
    
    // TODO: 格式化请求参数
    static func formatRequest(with parameters: inout [String: String]?, url: inout String) {
        
    }
    
    static func errorString(with error: Error) -> String {
        return error.localizedDescription
    }
    
}
