//
//  ButtonsBar.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol ButtonsBarDelegate {
    func buttonsBarDidSelectedindex(_ index: Int?)
}

class ButtonsBar: UIView {
 
    fileprivate let buttonW: CGFloat = 66
    fileprivate let buttonH: CGFloat = 20
    fileprivate let buttonTitleFontSize: CGFloat = 16
    fileprivate var underline: UIView = UIView()
    fileprivate var titlesArray: [String] = []
    fileprivate var margin: CGFloat = 0
    var delegate: ButtonsBarDelegate?
    var buttonsList: [UIButton] = []
    var lineH: CGFloat = 2.4
    var normalColor: UIColor = UIColor.colorWithHexString("9A9A9A")
    var selectedColor: UIColor = SDGBlue
    
    fileprivate var barLeftMar: CGFloat {
        return SCREEN_WIDTH - self.gg_w / 2
    }
    
    fileprivate var underlineRange: CGFloat {
        return self.gg_w - buttonW
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let stackView = UIStackView(arrangedSubviews: buttonsList)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = margin
        
        addSubview(stackView)
        stackView.snp_makeConstraints { $0.center.equalToSuperview() }
        
        underline.frame = CGRect(x: 0, y: gg_h - lineH, width: buttonW, height: lineH)
        underline.backgroundColor = selectedColor
        
        addSubview(underline)
    }
 
    convenience init(frame: CGRect, titlesArray: [String], buttonMargin: CGFloat) {
        self.init(frame: frame)
        self.margin = buttonMargin
        self.titlesArray = titlesArray
        self.buttonsList = self.titlesArray.map {
            let button = UIButton(type: .custom)
            button.backgroundColor = UIColor.clear
            button.frame = CGRect(x: 0, y: 0, width: buttonW, height: buttonW)
            button.titleLabel?.font = UIFont.systemFont(ofSize: buttonTitleFontSize, weight: UIFontWeightMedium)
            button.addTarget(self, action: #selector(ButtonsBar.btnDidClicked(_:)), for: .touchUpInside)
            button.setTitle($0, for: UIControlState())
            button.setTitleColor(normalColor, for: UIControlState())
            button.setTitleColor(selectedColor, for: .selected)
            return button
        }
        backgroundColor = UIColor.clear
    }

}

extension ButtonsBar {
    
    func btnDidClicked(_ sender: UIButton)  {
        selectedIndex = buttonsList.index(of: sender)
    }
    
    func scrollUnderlineXPercentageTo(_ x: CGFloat) {        
        underline.gg_x = underlineRange * x
    }
    
}

extension ButtonsBar: SDGRadioButtonProtocol {
    
    func radioButtonDidSelectedIndex(_ index: Int?) {   
        if let dlg = delegate {
            dlg.buttonsBarDidSelectedindex(index)
        }
    }
        
}
