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
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        EasyDivideLineManager.sharedManager.lineColor = UIColor.colorWithHexString(stringToConvert: "f1f1f1")
        headerView.addBottomDivideLineWithDoubleInsets(10)
        footerView.addTopDivideLineWithDoubleInsets(10)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateDataSource(_ modelSource: SDGGroupCellModel) {
        
    }
    
}
