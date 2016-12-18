//
//  SDGApi+Helper.swift
//  Swift-DGtle
//
//  Created by apple on 2016/12/15.
//  Copyright © 2016年 luminia. All rights reserved.
//

import Foundation

enum SDGAvatarSize: String {
    case small = "small"
    case middle = "middle"
    case big = "big"
}

extension SDGAPI {

    /// 获取头像URL
    ///
    /// - Parameters:
    ///   - uid: user id
    ///   - size: small/middle/big
    /// - Returns: URL
    static private func avatarUrl(with uid: String, `for` size: SDGAvatarSize) -> String {
        
        let url = SDGAPI.AVATAR_HOST_URL
        
        // 资源后缀
        let suffix = "_avatar_\(size.rawValue).jpg"
        
        var aUid = "000000"
        
        // 如果不足六位要补足
        if uid.characters.count < 6 {
            let bitCount = 6 - uid.characters.count
            aUid = aUid.substring(to: aUid.index(aUid.startIndex, offsetBy: bitCount))
            aUid.append(uid)
        }
        
        var charArr = aUid.characters.map { "\($0)" }
        // 在偶数位前面加'/'
        for index in charArr.indices {
            var seperator = index % 2 == 0 ? "/" : ""
            seperator.append(charArr[index])
            charArr[index] = seperator
        }
        
        let readyUrl = charArr.joined()
        
        return url + readyUrl + suffix
    }
    
    
    /// 获取小头像
    ///
    /// - Parameter uid: user id
    /// - Returns: URL
    static func smallAvatar(_ uid: String) -> String {
        return avatarUrl(with: uid, for: .small)
    }
    
    /// 获取中头像
    ///
    /// - Parameter uid: user id
    /// - Returns: URL
    static func middleAvatar(_ uid: String) -> String {
        return avatarUrl(with: uid, for: .middle)
    }
    
    /// 获取大头像
    ///
    /// - Parameter uid: user id
    /// - Returns: URL
    static func bigAvatar(_ uid: String) -> String {
        return avatarUrl(with: uid, for: .big)
    }
    
}
