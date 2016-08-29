//
//  SDGHomeTableViewCell.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit


class SDGHomeTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension SDGHomeTableViewCell: SDTableCellConfigureProtocol {
    
    static var cellReuseIdentifier: String {
        return "SDG_HOME_TABLE_CELL_REUSED_ID"
    }
    
    func updateDataSource(modelSource: HomeArticalModel) {
        
    }
    
}