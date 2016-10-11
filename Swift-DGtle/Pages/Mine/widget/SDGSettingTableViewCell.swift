//
//  SDGSettingTableViewCell.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/10.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

enum SDGSettingCellMode {
    case label
    case `switch`
}

class SDGSettingTableViewCell: UITableViewCell, SDTableCellConfigureProtocol {

    static var cellReuseIdentifier: String {
        return "SDG_SETTING_TABLE_VIEW_CELL_REUSED_ID"
    }
    
    static let cellHeight: CGFloat = 50
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var arrow: UIImageView!
    
    var mode: SDGSettingCellMode = .label {
        didSet {
            switcher.isHidden = mode == .label
            arrow.isHidden = mode == .switch
            content.isHidden = mode == .switch
        }
    }
    
    var topLine: UIView = {
        let line = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SINGLE_LINE_WIDTH))
        line.backgroundColor = SINGLE_LINE_COLOR
        return line
    }()
    
    var btmLine: UIView = {
        let line = UIView(frame: CGRect(x: 0, y: SDGSettingTableViewCell.cellHeight - SINGLE_LINE_WIDTH, width: SCREEN_WIDTH, height: SINGLE_LINE_WIDTH))
        line.backgroundColor = SINGLE_LINE_COLOR
        return line
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        EasyDivideLineManager.sharedManager.lineColor = UIColor.colorWithHexString(stringToConvert: "e4e4e4")
        addBottomDivideLineWithLeftInset(15)
        
        addSubview(topLine)
        addSubview(btmLine)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isSelected { isSelected = false }
    }
    
    func updateDataSource(_ modelSource: SDSettingCellItem) {
        title.text = modelSource.title
        topLine.isHidden = !modelSource.isHead
        btmLine.isHidden = !modelSource.isTail
        content.text = modelSource.content
        
        mode = modelSource.mode
    }
}
