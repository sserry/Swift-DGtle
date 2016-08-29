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
    @IBAction func doLogin(sender: AnyObject) {
        if let clousure = loginBlock {
            clousure()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        view.snp_makeConstraints { $0.edges.equalToSuperview() }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = NSBundle.mainBundle().loadNibNamed("SDGUserUnloginHeader", owner: self, options: nil)[0] as! UIView
        backgroundColor = UIColor.clearColor()
        addSubview(view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
