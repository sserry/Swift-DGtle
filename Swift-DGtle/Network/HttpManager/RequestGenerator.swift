//
//  RequestGenerator.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/16.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation

protocol RequestAnswerable  {
    
    func handleFailure(with error: Error, apiName: String)
    
    func handleSuccess(with retObj: AnyObject, apiFlag: String)
    
}
