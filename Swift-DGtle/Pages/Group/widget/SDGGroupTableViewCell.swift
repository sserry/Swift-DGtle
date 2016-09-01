//
//  SDGGroupTableViewCell.swift
//  Swift-DGtle
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGroupTableViewCell: UITableViewCell, SDTableCellConfigureProtocol {
    
    static var cellReuseIdentifier: String {
        return "SDGGROUP_CELL_REUSED_ID"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateDataSource(modelSource: SDGGroupCellModel) {
        
    }
    
}
