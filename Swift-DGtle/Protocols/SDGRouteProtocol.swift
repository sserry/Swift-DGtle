//
//  SDGRouteProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/1.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

/**
 *  小组-发现 路由
 */
enum SDGPageStatus {
    
    case goNewGroups
    case goHotTopics
    case goAGroup(groupID: String)
    case goBannerTopic(topicID: String)
    case goTopicDetail(topicID: String)
}

protocol SDGRouteProtocol: class {
    
}

extension SDGRouteProtocol where Self: UIViewController {
    
    func go(to state: SDGPageStatus) {
        switch state {
        case .goNewGroups:
            navigationController?.pushViewController(SDGGroupLeftChildViewController(), animated: true)
            break
        case .goHotTopics:
            break
        case .goAGroup(let groupID):
            break
        case .goBannerTopic(let topicID):
            break
        case .goTopicDetail(let topicID):
            break
        }
    }

}
