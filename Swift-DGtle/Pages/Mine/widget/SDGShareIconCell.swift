//
//  SDGShareIconCell.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/12.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGShareIconCell: UITableViewCell, SDTableCellConfigureProtocol {

    static var cellReuseIdentifier: String {
        return "SDG_SHARE_ICON_CELL_REUSED_ID"
    }
    
    static let height: CGFloat = 70
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBottomDivideLine()
        selectionStyle = .none
    }
    
    func updateDataSource(_ modelSource: String) { }

}
