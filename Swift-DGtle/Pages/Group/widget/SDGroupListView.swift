//
//  SDGroupListView.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGroupListView: UIStackView {
 
    convenience init(withHeight height: CGFloat, spacing: CGFloat, groupList: [AnyObject] ) {
        self.init(frame: CGRect(x: 0, y: 0, width: (kGroupCardW + spacing) * CGFloat(groupList.count), height: height))
        self.spacing = spacing
        axis = .horizontal
        distribution = .fillEqually
        
        for _ in groupList.indices { addArrangedSubview(SDGroupCard(withGroupModel: "" as AnyObject)) }

    }

}
