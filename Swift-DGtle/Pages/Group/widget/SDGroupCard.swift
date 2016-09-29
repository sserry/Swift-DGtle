//
//  SDGroupCard.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/30.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

public let kGroupCardW: CGFloat = 140
public let kGroupCardH: CGFloat = 162

class SDGroupCard: UIView, SDGLoadViewFromNibProtocol {

    convenience init(withGroupModel model: AnyObject) {
        self.init(frame: CGRect(x: 0, y: 0, width: kGroupCardW, height: kGroupCardH))
        loadViewFromNib()
    }

}
