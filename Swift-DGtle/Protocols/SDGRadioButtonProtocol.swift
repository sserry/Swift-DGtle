//
//  SDRadioButtonProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

/**
 *  Radio Button Container Protocol
 */
protocol SDGRadioButtonProtocol: class {
    var buttonsList: [UIButton] { get }
    func radioButtonDidSelectedIndex(_ index: Int?)
}

extension SDGRadioButtonProtocol{

    var selectedIndex: Int? {
        
        get {
            for index in buttonsList.indices {
                if buttonsList[index].isSelected {
                    return index
                }
            }
            return nil
        }
        
        set {
            for index in buttonsList.indices {
                buttonsList[index].isSelected = index == newValue
                if index == newValue {
                    radioButtonDidSelectedIndex(index)
                }
            }
        }
        
    }
}
