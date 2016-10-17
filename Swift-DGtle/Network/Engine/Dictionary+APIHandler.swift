//
//  Dictionary+APIHandler.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

typealias HttpRequestSuccessClosure = (AnyObject) -> Void
typealias HttpRequestFailClosure    = (Error) -> Void
typealias HttpFormDataClosure       = (MultipartFormData) -> Void
typealias HttpProgressClosure       = (CGFloat) -> Void

let __kAPIREQTYPE = "API.REQTYPE"
let __kAPINAME    = "API.URLNAME"

import UIKit
import SVProgressHUD
import Alamofire

extension Dictionary {
    
    func httpOperation(with param: [String: AnyObject], hud: SVProgressHUD, delegate: RequestAnswerable) {
    
    }
    
    func httpOperation(with param: [String: AnyObject], hud: SVProgressHUD, delegate: RequestAnswerable, apiFlag: String) {
        
    }
    
    
    func httpOperation(with param: [String: AnyObject], hud: SVProgressHUD, delegate: RequestAnswerable,
                       success: HttpRequestSuccessClosure,
                       failure: HttpRequestFailClosure) {
        
    }
    
    func httpOperation(with param: [String: AnyObject], hud: SVProgressHUD, delegate: RequestAnswerable,
                       formData: MultipartFormData,
                       success: HttpRequestSuccessClosure,
                       failure: HttpRequestFailClosure,
                       progressClosure: HttpProgressClosure ) {
        
    }

    
    var api: String {
        let key = __kAPINAME as! Key
        return self[key] as! String
    }
    
    var requestMethod: HTTPMethod {
        let key = __kAPIREQTYPE as! Key
        return HTTPMethod(rawValue: self[key] as! String)!
    }
}

