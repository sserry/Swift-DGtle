//
//  SDGroupShowMoreCell.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

fileprivate let kScrollViewInset: CGFloat = 10

class SDGroupShowMoreCell: UITableViewCell, SDTableCellConfigureProtocol {

    static var cellReuseIdentifier: String {
        return "SDG_GROUP_SHOW_MORE_CELL_REUSED_ID"
    }
    
    static let kSectionH: CGFloat = 62
    static let kGroupScrollViewH: CGFloat = 172
    static var kCellH: CGFloat {
        return kSectionH * 2 + kGroupScrollViewH
    }
    
    fileprivate var groupList = [AnyObject]()
    fileprivate var upperSection = SDGGroupMoreCellSectionView(withTitle: "最新小组", andSubtitle: "发现新鲜好玩的尾巴小组", targetStatus: .goNewGroups)
    fileprivate var lowerSection = SDGGroupMoreCellSectionView(withTitle: "随便看看", andSubtitle: "最热门的小组话题在此集合", targetStatus: .goNewGroups)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        selectionStyle = .none
        
        backgroundColor = UIColor.colorWithHexString(stringToConvert: "EEEEEE")
        
        let groupScrollView: UIScrollView = {
            let scv = UIScrollView(frame: CGRect(x: 0, y: 66, width: SCREEN_WIDTH, height: 80))
            scv.backgroundColor = UIColor.colorWithHexString(stringToConvert: "EEEEEE")
            let groupStack = SDGroupListView(withHeight: SDGroupShowMoreCell.kGroupScrollViewH - kScrollViewInset,
                                         spacing: kScrollViewInset,
                                         groupList: groupList)
            scv.addSubview(groupStack)
            scv.showsHorizontalScrollIndicator = false
            scv.contentInset = UIEdgeInsets(top: 0, left: kScrollViewInset, bottom: 0, right: kScrollViewInset)
            scv.contentSize = CGSize(width: groupStack.gg_w, height: groupStack.gg_h)
            
            return scv
        }()
        
        addSubview(upperSection)
        addSubview(lowerSection)
        addSubview(groupScrollView)
        
        upperSection.gg_equalWT(withHeight: SDGroupShowMoreCell.kSectionH)
        groupScrollView.gg_equalWidth(withView: upperSection,
                                      TopOffset: SDGroupShowMoreCell.kSectionH,
                                      andHeight: SDGroupShowMoreCell.kGroupScrollViewH)
        lowerSection.gg_equalWB(withHeight: SDGroupShowMoreCell.kSectionH)
    }
    
    func updateDataSource(_ modelSource: [AnyObject]) {
        groupList = modelSource
    }

}
