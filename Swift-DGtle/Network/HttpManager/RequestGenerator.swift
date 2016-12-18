//
//  RequestGenerator.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

protocol RequestAnswerable  {
    
    func handleFailure(with error: NSError, apiName: String)
    
    func handleSuccess(with retObj: JSON, apiName: String, apiFlag: String)
    
}

class RequestGenerator {
    
    fileprivate var envApiHost: EnvApiHost!
    fileprivate var apiPath: String!
    fileprivate var params: [String: String]?
    
    fileprivate var originClass: AnyClass
    
    var reqMethod: HTTPMethod
    var flagCommonApi: String
    var delegate: RequestAnswerable
    var hudApi: SVProgressHUD?
    
    init(_ env: EnvApiHost, api: String, params: [String: String], delegate: RequestAnswerable, method: HTTPMethod) {
        self.envApiHost = env
        self.apiPath = api
        self.params = params
        self.delegate = delegate
        self.originClass = object_getClass(self.delegate)
        self.flagCommonApi = ""
        self.reqMethod = method
    }
    
    open func beginRequest() {
        
        if !checkNetworkStatus() { return }
        
        HttpRequest.httpRequest(in: envApiHost, reqMethod: reqMethod, apiPath: apiPath, params: params, delegateObj: self as AnyObject, delegateHandler: #selector(callBack(_:)))
        
    }
    
    /// selector是oc方法 不能使用Swift的类型当参数
    @objc func callBack(_ obj: AnyObject) {
     // MARK: TODO @ -- HUD IMPLEMENTION
        if hudApi != nil {
//            hudApi.hide
        }
        
        if let objDict = obj as? [String: String] {
            // TODO @ -- BASE MODEL CONVERTION
            
            let jsonData = JSON(objDict)
            
            excuteSuccess(jsonData)
            
        } else {
            if let errStr = obj as? String {
                failWithErrorText(errStr)
                return
            }
            failWithErrorText("System Error")
        }
        
    }
    
    open func failWithErrorText(_ text: String) {
        let error = NSError.init(domain: "errormessage", code: 0, userInfo: [NSLocalizedDescriptionKey: text])
        failWithError(error)
    }
    
    // MARK: -- private methods --
    fileprivate func failWithError(_ err: NSError)  {
        if object_getClass(delegate) == originClass {
            delegate.handleFailure(with: err, apiName: apiPath)
        }
    }
    
    fileprivate func excuteSuccess(_ retObj: JSON) {
        if object_getClass(delegate) == originClass {
            delegate.handleSuccess(with: retObj, apiName: apiPath, apiFlag: flagCommonApi)
        }
    }
    
    fileprivate func checkNetworkStatus() -> Bool {
        if !SDGGlobal.shared.networkOK {
            return false
        }
        
        if hudApi != nil {
            // MARK: TODO @ -- HUD IMPLEMENTION
//            self.hudApi.showProcessing
        }
        
        return true
    }
}
