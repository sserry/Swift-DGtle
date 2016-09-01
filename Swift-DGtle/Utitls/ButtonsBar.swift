//
//  ButtonsBar.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol ButtonsBarDelegate {
    func buttonsBarDidSelectedindex(index: Int?)
}

class ButtonsBar: UIView {
 
    private let buttonW: CGFloat = 66
    private let buttonH: CGFloat = 20
    private let buttonTitleFontSize: CGFloat = 16
    private var underline: UIView = UIView()
    private var titlesArray: [String] = []
    private var margin: CGFloat = 0
    var delegate: ButtonsBarDelegate?
    var buttonsList: [UIButton] = []
    var lineH: CGFloat = 2.4
    var normalColor: UIColor = UIColor.colorWithHexString("9A9A9A")
    var selectedColor: UIColor = SDGBlue
    
    private var barLeftMar: CGFloat {
        return SCREEN_WIDTH - self.gg_w / 2
    }
    
    private var underlineRange: CGFloat {
        return self.gg_w - buttonW
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let stackView = UIStackView(arrangedSubviews: buttonsList)
        stackView.axis = .Horizontal
        stackView.distribution = .EqualSpacing
        stackView.alignment = .Center
        stackView.spacing = margin
        
        addSubview(stackView)
        stackView.snp_makeConstraints { $0.center.equalToSuperview() }
        
        underline.frame = CGRectMake(0, gg_h - lineH, buttonW, lineH)
        underline.backgroundColor = selectedColor
        
        addSubview(underline)
    }
 
    convenience init(frame: CGRect, titlesArray: [String], buttonMargin: CGFloat) {
        self.init(frame: frame)
        self.margin = buttonMargin
        self.titlesArray = titlesArray
        self.buttonsList = self.titlesArray.map {
            let button = UIButton(type: .Custom)
            button.backgroundColor = UIColor.clearColor()
            button.frame = CGRectMake(0, 0, buttonW, buttonW)
            button.titleLabel?.font = UIFont.systemFontOfSize(buttonTitleFontSize, weight: UIFontWeightMedium)
            button.addTarget(self, action: #selector(ButtonsBar.btnDidClicked(_:)), forControlEvents: .TouchUpInside)
            button.setTitle($0, forState: .Normal)
            button.setTitleColor(normalColor, forState: .Normal)
            button.setTitleColor(selectedColor, forState: .Selected)
            return button
        }
        backgroundColor = UIColor.clearColor()
    }

}

extension ButtonsBar {
    
    func btnDidClicked(sender: UIButton)  {
        selectedIndex = buttonsList.indexOf(sender)
    }
    
    func scrollUnderlineXPercentageTo(x: CGFloat) {        
        underline.gg_x = underlineRange * x
    }
    
}

extension ButtonsBar: SDGRadioButtonProtocol {
    
    func radioButtonDidSelectedIndex(index: Int?) {   
        if let dlg = delegate {
            dlg.buttonsBarDidSelectedindex(index)
        }
    }
        
}
