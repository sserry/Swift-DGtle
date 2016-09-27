//
//  SDGHomeTableHeader.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import SDCycleScrollView

class SDGHomeTableHeader: UIView {

    static let bannerLabelH: CGFloat = 30
    static let bannerImageH: CGFloat = 131 * RESIZE_FACTOR
    static let bannerHeight = bannerImageH  + bannerLabelH
    fileprivate let bannerScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: bannerImageH))
    let bannerTextLabel = UILabel.labelWithNormalFontSize(13, textColor: TEXT_GRAY, labelText: "尾巴编辑谈｜你是通过什么方式来关注今年的里约奥运的", textAlign: .center)
    
    convenience init(imageUrls: [String], scrollViewDelegate: SDCycleScrollViewDelegate) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SDGHomeTableHeader.bannerHeight))
        bannerScrollView.delegate = scrollViewDelegate
        bannerScrollView.placeholderImage = UIImage(named: "article_default_new")
        bannerScrollView.imageURLStringsGroup = imageUrls
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addSubview(bannerScrollView)
        bannerScrollView.gg_equalWidthLayoutWithTopOffset(topOffset: 0, andHeight: SDGHomeTableHeader.bannerImageH)
        bannerScrollView.pageDotColor = UIColor.white.withAlphaComponent(0.4)
        
        bannerTextLabel.backgroundColor = UIColor.white
        addSubview(bannerTextLabel)
        bannerTextLabel.gg_equalWBLayoutWithHeight(SDGHomeTableHeader.bannerLabelH)
        
        addBottomDivideLine()
    }
    
}
