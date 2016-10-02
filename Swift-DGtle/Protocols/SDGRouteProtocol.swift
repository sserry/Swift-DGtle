//
//  SDGRouteProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/1.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

/**
 *  路由
 */
enum SDGPageStatus {
    
    case goNewGroups
    case goHotTopics
    case goAGroup(groupID: String)
    case goBannerTopic(topicID: String)
    case goTopicDetail(topicID: String)
    case goLogin
}

@objc protocol SDGRouteProtocol: class {
    
}

extension SDGRouteProtocol {
    
    func go(to state: SDGPageStatus) {
        switch state {
        case .goNewGroups:
            push(to: SDGGroupLeftChildViewController())
            break
        case .goHotTopics:
            break
        case .goAGroup(let groupID):
            break
        case .goBannerTopic(let topicID):
            break
        case .goTopicDetail(let topicID):
            break
        case .goLogin:
            let navVC = SDGNavigationController(rootViewController: SDGLoginViewController())
            present(navVC)
            break
        }
    }
    
    
    func push(to page: UIViewController) {
        push(to: page, animated: true)
    }
    
    func push(to page: UIViewController, animated: Bool) {
        currentNavigationController?.pushViewController(page, animated: animated)
    }
    
    func present(toPage page: UIViewController, animated: Bool, completion: (() -> Void)?) {
        currentNavigationController?.present(page, animated: animated, completion: completion)
    }
    
    func present(_ page: UIViewController) {
        present(toPage: page, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func dismissCurrentNavigation() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
