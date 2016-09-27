//
//  SDGroupShowMoreCell.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGroupShowMoreCell: UITableViewCell, SDTableCellConfigureProtocol {

    static var cellReuseIdentifier: String {
        return "SDG_GROUP_SHOW_MORE_CELL_REUSED_ID"
    }
    
    static let sectionH: CGFloat = 62
    static let groupScrollViewH: CGFloat = 172
    static var cellH: CGFloat {
        return sectionH * 2 + groupScrollViewH
    }
    
    //current navigation view controller
    fileprivate var curNVC = SDGNavigationController() {
        didSet {
            upperSection.showMoreBtnClicked = { [unowned curNVC] in
                //MARK: TODO Implemented later
                curNVC.pushViewController(SDGMineViewController(), animated: true)
            }
            
            lowerSection.showMoreBtnClicked = { [unowned curNVC] in
                //MARK: TODO Implemented later
                curNVC.pushViewController(SDGMineViewController(), animated: true)
            }
        }
    }
    
    fileprivate var upperSection = SDGGroupMoreCellSectionView(withTitle: "最新小组", andSubtitle: "发现新鲜好玩的尾巴小组") {}
    fileprivate var lowerSection = SDGGroupMoreCellSectionView(withTitle: "随便看看", andSubtitle: "最热门的小组话题在此集合") {}
    
    fileprivate var groupScrollView = UIScrollView(frame: CGRect(x: 0, y: 66, width: SCREEN_WIDTH, height: 80))
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        backgroundColor = UIColor.colorWithHexString(stringToConvert: "EEEEEE")
        
        addSubview(upperSection)
        addSubview(lowerSection)
        addSubview(groupScrollView)
        
        
        upperSection.gg_equalWT(withHeight: SDGroupShowMoreCell.sectionH)
        groupScrollView.gg_equalWidth(withView: upperSection,
                                                    TopOffset: SDGroupShowMoreCell.sectionH,
                                                    andHeight: SDGroupShowMoreCell.groupScrollViewH)
        lowerSection.gg_equalWB(withHeight: SDGroupShowMoreCell.sectionH)
    }
    
    func updateDataSource(_ modelSource: SDGNavigationController) {
        curNVC = modelSource
    }

}
