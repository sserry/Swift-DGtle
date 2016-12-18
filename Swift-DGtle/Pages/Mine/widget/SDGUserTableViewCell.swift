//
//  SDGUserTableViewCell.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/28.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGUserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if self.isSelected  {
            self.isSelected = false
        }
    }
    
}

extension SDGUserTableViewCell: SDTableCellConfigureProtocol {
    static var cellReuseIdentifier: String {
        return "USER_TABLE_CELL_REUSE_IDENTIFER"
    }
    
    func updateDataSource(_ modelSource: SDGUserCellSettingModel) {
        cellIcon.image = UIImage(named: modelSource.iconName)
        cellLabel.text = modelSource.title
    }
    
}

struct SDGUserCellSettingModel {
    let iconName: String!
    let title: String!
}
