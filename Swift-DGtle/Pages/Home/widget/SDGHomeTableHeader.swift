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
    
    let bannerScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: bannerImageH))
    let bannerTextLabel = UILabel.labelWithNormalFontSize(13, textColor: TEXT_GRAY, labelText: "", textAlign: .center)
    
    var titles: [String]?
    var currentTitle: String? {
        didSet {
            bannerTextLabel.text = currentTitle
        }
    }
    
    convenience init(imageUrls: [String]? = nil, scrollViewDelegate: SDCycleScrollViewDelegate) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SDGHomeTableHeader.bannerHeight))
        
        weak var delegate = scrollViewDelegate
        bannerScrollView.delegate = delegate
        bannerScrollView.placeholderImage = SDGPlaceHolder.BANNER_PLACEHOLDER
        bannerScrollView.imageURLStringsGroup = imageUrls
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addSubview(bannerScrollView)
        
        bannerScrollView.gg_equalWidth(withTopOffset: 0, andHeight: SDGHomeTableHeader.bannerImageH)
        bannerScrollView.pageDotColor = UIColor.white.withAlphaComponent(0.4)
        
        bannerTextLabel.backgroundColor = UIColor.white
        addSubview(bannerTextLabel)
        bannerTextLabel.gg_equalWB(withHeight: SDGHomeTableHeader.bannerLabelH)
        
         addBottomDivideLine()
 
 
    }
    
}
