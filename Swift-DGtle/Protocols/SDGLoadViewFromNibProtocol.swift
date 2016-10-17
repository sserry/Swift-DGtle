//
//  SDGLoadViewFromNibProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 2016/9/30.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol SDGLoadViewFromNibProtocol {}

extension SDGLoadViewFromNibProtocol where Self: UIView {
    
    func loadViewFromNib() {
        if let nib = Bundle.main.loadNibNamed("\(type(of: self))", owner: self, options: nil) {
            if let view = nib[0] as? UIView {
                addSubview(view)
                view.frame = bounds
            }
            
            
        }
        
    }
}
