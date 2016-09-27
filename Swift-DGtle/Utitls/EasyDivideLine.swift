//
//  EasyDivideLine.swift
//  designMan
//
//  Created by Greg Zhang on 16/8/25.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

//public let SINGLE_LINE_WIDTH         = 1.0 / UIScreen.mainScreen().scale
public let GLOBAL_DIVIDE_LINE_COLOR  = UIColor(colorLiteralRed: 204.0 / 255.0, green: 204.0 / 255.0, blue: 204.0 / 255.0, alpha: 1)

enum LineDirection {
    case vertical(topOffset: CGFloat, bottomOffset: CGFloat, side: NSLayoutAttribute)
    case horizental(leftOffset: CGFloat, rightOffset: CGFloat, side: NSLayoutAttribute)
}

class EasyDivideLineManager {
    
    fileprivate static let sharedInstance = EasyDivideLineManager()
    var lineWidth: CGFloat = SINGLE_LINE_WIDTH
    var lineColor: UIColor = GLOBAL_DIVIDE_LINE_COLOR
    
    class var sharedManager: EasyDivideLineManager {
        return sharedInstance
    }
    
}

/**
 *  Add a divide line on one side of a view
 */
extension UIView {

    func addDivideLineOnSide(_ direction: LineDirection, withColor color: UIColor, andWidth aWidth: CGFloat ) {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = color
        addSubview(line)
        switch direction {
        case .horizental(let lOffset, let rOffset, let side):
            let leftLayoutConstraint = NSLayoutConstraint(item: line, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: lOffset)
            let rightLayoutCOntraint = NSLayoutConstraint(item: line, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -rOffset)
            let vLayoutContraint = NSLayoutConstraint(item: line, attribute: side, relatedBy: .equal, toItem: self, attribute: side, multiplier: 1, constant: 0)
            let heightLayoutContraint = NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: aWidth)
            addConstraints([leftLayoutConstraint, rightLayoutCOntraint, vLayoutContraint])
            line.addConstraints([heightLayoutContraint])
            break
        case .vertical(let tOffset, let bOffset, let side):
            let topLayoutConstraint = NSLayoutConstraint(item: line, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: tOffset)
            let btmLayoutConstraint = NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -bOffset)
            let hLayoutContraint = NSLayoutConstraint(item: line, attribute: side, relatedBy: .equal, toItem: self, attribute: side, multiplier: 1, constant: 0)
            let widthLayoutContraint = NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: aWidth)
            addConstraints([topLayoutConstraint, btmLayoutConstraint, hLayoutContraint])
            line.addConstraints([widthLayoutContraint])
            break
        }
    }
}

/**
 *  Bottom Extension
 */
extension UIView {
    
    func addBottomLineWithLeftInset(_ leftInset: CGFloat, rightInset: CGFloat) {
        
        addDivideLineOnSide(.horizental(leftOffset: leftInset, rightOffset: rightInset, side: .bottom),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addBottomDivideLineWithDoubleInsets(_ inset: CGFloat) {
        addBottomLineWithLeftInset(inset, rightInset: inset)
    }
    
    func addBottomDivideLineWithLeftInset(_ leftInset: CGFloat) {
        addBottomLineWithLeftInset(leftInset, rightInset: 0)
    }
    
    func addBottomDivideLineWithRightInset(_ rightInset: CGFloat) {
        addBottomLineWithLeftInset(0, rightInset: rightInset)
    }
    
    func addBottomDivideLine() {
        addBottomDivideLineWithDoubleInsets(0)
    }
}

/**
 *  Top Extension
 */
extension UIView {

    func addTopLineWithLeftInset(_ leftInset: CGFloat, rightInset: CGFloat) {
        
        addDivideLineOnSide(.horizental(leftOffset: leftInset, rightOffset: rightInset, side: .top),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addTopDivideLineWithDoubleInsets(_ inset: CGFloat) {
        addTopLineWithLeftInset(inset, rightInset: inset)
    }
    
    func addTopDivideLineWithLeftInset(_ leftInset: CGFloat) {
        addTopLineWithLeftInset(leftInset, rightInset: 0)
    }
    
    func addTopDivideLineWithRightInset(_ rightInset: CGFloat) {
        addTopLineWithLeftInset(0, rightInset: rightInset)
    }
    
    func addTopDivideLine() {
        addTopDivideLineWithDoubleInsets(0)
    }
}

/**
 *  Left Extension
 */
extension UIView {
    func addLeftLineWithTopInset(_ topInset: CGFloat, bottomInset: CGFloat) {
        
        addDivideLineOnSide(.vertical(topOffset: topInset, bottomOffset: bottomInset, side: .left),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addLeftDivideLineWithDoubleInsets(_ inset: CGFloat) {
        addLeftLineWithTopInset(inset, bottomInset: inset)
    }
    
    func addLeftDivideLineWithTopInset(_ topInset: CGFloat) {
        addLeftLineWithTopInset(topInset, bottomInset: 0)
    }
    
    func addLeftDivideLineWithBottomInset(_ bottomInset: CGFloat) {
        addLeftLineWithTopInset(0, bottomInset: bottomInset)
    }
    
    func addLeftDivideLine() {
        addLeftDivideLineWithDoubleInsets(0)
    }
}

/**
 *  Right Extension
 */
extension UIView {
    func addRightLineWithTopInset(_ topInset: CGFloat, bottomInset: CGFloat) {
        
        addDivideLineOnSide(.vertical(topOffset: topInset, bottomOffset: bottomInset, side: .right),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addRightDivideLineWithDoubleInsets(_ inset: CGFloat) {
        addRightLineWithTopInset(inset, bottomInset: inset)
    }
    
    func addRightDivideLineWithTopInset(_ topInset: CGFloat) {
        addRightLineWithTopInset(topInset, bottomInset: 0)
    }
    
    func addRightDivideLineWithBottomInset(_ bottomInset: CGFloat) {
        addRightLineWithTopInset(0, bottomInset: bottomInset)
    }
    
    func addRightDivideLine() {
        addRightDivideLineWithDoubleInsets(0)
    }
}
