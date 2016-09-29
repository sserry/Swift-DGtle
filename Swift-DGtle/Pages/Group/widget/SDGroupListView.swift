//
//  SDGroupListView.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

fileprivate let kGroupViewW: CGFloat = 125

class SDGroupListView: UIStackView {
 
    convenience init(withHeight height: CGFloat, spacing: CGFloat, groupList: [AnyObject] ) {
        self.init(frame: CGRect(x: 0, y: 0, width: (kGroupViewW + spacing) * CGFloat(groupList.count), height: height))
        self.spacing = spacing
        axis = .horizontal
        distribution = .fillEqually
        
        for _ in groupList.indices {
            let v = UIView()
            v.mj_size = CGSize(width: kGroupViewW, height: 67)
            v.backgroundColor = UIColor.gray
            addArrangedSubview(v)
        }

    }

}
