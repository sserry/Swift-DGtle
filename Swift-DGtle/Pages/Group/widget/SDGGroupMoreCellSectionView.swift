//
//  SDGGroupMoreCellSectionView.swift
//  Swift-DGtle
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupMoreCellSectionView: UIView, SDGLoadViewFromNibProtocol{

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var sectionSubtitle: UILabel!
    @IBAction func showMore(_ sender: UIButton) {
        if let closure = showMoreBtnClicked { closure() }
    }
    
    var showMoreBtnClicked: (() -> Void)?
    
    convenience init(withTitle title: String!,
                     andSubtitle subtitle: String!,
                     showMoreBlock  block: @escaping () -> Void) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 66))
        
        loadViewFromNib()
        sectionTitle.text = title
        sectionSubtitle.text = subtitle
        showMoreBtnClicked = block
    }
    

}
