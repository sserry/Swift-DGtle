//
//  SDGUserUnloginHeader.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGUserUnloginHeader: UIView {

    var loginBlock: (() -> ())?
    var view = UIView()
    @IBAction func doLogin(_ sender: AnyObject) {
        if let clousure = loginBlock {
            clousure()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = Bundle.main.loadNibNamed("SDGUserUnloginHeader", owner: self, options: nil)?[0] as! UIView
        backgroundColor = UIColor.clear
        addSubview(view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
