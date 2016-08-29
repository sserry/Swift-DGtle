//
//  SDRadioButtonProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol SDGRadioButtonProtocol: class {
    var buttonsList: [UIButton] { get }
    func radioButtonDidSelectedIndex(index: Int?)
}

extension SDGRadioButtonProtocol{

    var selectedIndex: Int? {
        
        get {
            for index in buttonsList.indices {
                if buttonsList[index].selected {
                    return index
                }
            }
            return nil
        }
        
        set {
            for index in buttonsList.indices {
                buttonsList[index].selected = index == newValue
                if index == newValue {
                    radioButtonDidSelectedIndex(index)
                }
            }
        }
        
    }
}
