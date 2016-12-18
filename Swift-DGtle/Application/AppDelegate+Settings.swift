//
//  AppDelegate+Settings.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/15.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import Alamofire

// MARK: -SOME SETTINGS
extension AppDelegate {
    
    func registerAutomaticallyDismissKeyboard() {
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(AppDelegate.tapScreenToDismissKeyboard))
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main)
        { _ in self.window?.addGestureRecognizer(tapGR) }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main)
        { _ in self.window?.removeGestureRecognizer(tapGR) }
        
    }
    
    func tapScreenToDismissKeyboard() {
        window?.endEditing(true)
    }
    
    func connectionStatus() {
        let reachabilityManager = Alamofire.NetworkReachabilityManager()
        reachabilityManager?.startListening()
        reachabilityManager?.listener = { status in
            switch status {
            case .notReachable:
                SDGGlobal.shared.networkOK = false
                HTTP_HEAD.VALUE_WANTYPE = "NotReachable"
                break
            case .reachable(let networkType):
                if networkType == .ethernetOrWiFi {
                    SDGGlobal.shared.networkOK = true
                    HTTP_HEAD.VALUE_WANTYPE = "ethernetOrWiFi"
                } else {
                    SDGGlobal.shared.networkOK = true
                    HTTP_HEAD.VALUE_WANTYPE = "wwan"
                }
                break
            default:
                break
            }
        }
    }
    
}
