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
    case Vertical(topOffset: CGFloat, bottomOffset: CGFloat, side: NSLayoutAttribute)
    case Horizental(leftOffset: CGFloat, rightOffset: CGFloat, side: NSLayoutAttribute)
}

class EasyDivideLineManager {
    
    private static let sharedInstance = EasyDivideLineManager()
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

    func addDivideLineOnSide(direction: LineDirection, withColor color: UIColor, andWidth aWidth: CGFloat ) {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = color
        addSubview(line)
        switch direction {
        case .Horizental(let lOffset, let rOffset, let side):
            let leftLayoutConstraint = NSLayoutConstraint(item: line, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: lOffset)
            let rightLayoutCOntraint = NSLayoutConstraint(item: line, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: -rOffset)
            let vLayoutContraint = NSLayoutConstraint(item: line, attribute: side, relatedBy: .Equal, toItem: self, attribute: side, multiplier: 1, constant: 0)
            let heightLayoutContraint = NSLayoutConstraint(item: line, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: aWidth)
            addConstraints([leftLayoutConstraint, rightLayoutCOntraint, vLayoutContraint])
            line.addConstraints([heightLayoutContraint])
            break
        case .Vertical(let tOffset, let bOffset, let side):
            let topLayoutConstraint = NSLayoutConstraint(item: line, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: tOffset)
            let btmLayoutConstraint = NSLayoutConstraint(item: line, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: -bOffset)
            let hLayoutContraint = NSLayoutConstraint(item: line, attribute: side, relatedBy: .Equal, toItem: self, attribute: side, multiplier: 1, constant: 0)
            let widthLayoutContraint = NSLayoutConstraint(item: line, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 0, constant: aWidth)
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
    
    func addBottomLineWithLeftInset(leftInset: CGFloat, rightInset: CGFloat) {
        
        addDivideLineOnSide(.Horizental(leftOffset: leftInset, rightOffset: rightInset, side: .Bottom),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addBottomDivideLineWithDoubleInsets(inset: CGFloat) {
        addBottomLineWithLeftInset(inset, rightInset: inset)
    }
    
    func addBottomDivideLineWithLeftInset(leftInset: CGFloat) {
        addBottomLineWithLeftInset(leftInset, rightInset: 0)
    }
    
    func addBottomDivideLineWithRightInset(rightInset: CGFloat) {
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

    func addTopLineWithLeftInset(leftInset: CGFloat, rightInset: CGFloat) {
        
        addDivideLineOnSide(.Horizental(leftOffset: leftInset, rightOffset: rightInset, side: .Top),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addTopDivideLineWithDoubleInsets(inset: CGFloat) {
        addTopLineWithLeftInset(inset, rightInset: inset)
    }
    
    func addTopDivideLineWithLeftInset(leftInset: CGFloat) {
        addTopLineWithLeftInset(leftInset, rightInset: 0)
    }
    
    func addTopDivideLineWithRightInset(rightInset: CGFloat) {
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
    func addLeftLineWithTopInset(topInset: CGFloat, bottomInset: CGFloat) {
        
        addDivideLineOnSide(.Vertical(topOffset: topInset, bottomOffset: bottomInset, side: .Left),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addLeftDivideLineWithDoubleInsets(inset: CGFloat) {
        addLeftLineWithTopInset(inset, bottomInset: inset)
    }
    
    func addLeftDivideLineWithTopInset(topInset: CGFloat) {
        addLeftLineWithTopInset(topInset, bottomInset: 0)
    }
    
    func addLeftDivideLineWithBottomInset(bottomInset: CGFloat) {
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
    func addRightLineWithTopInset(topInset: CGFloat, bottomInset: CGFloat) {
        
        addDivideLineOnSide(.Vertical(topOffset: topInset, bottomOffset: bottomInset, side: .Right),
                            withColor: EasyDivideLineManager.sharedManager.lineColor,
                            andWidth: EasyDivideLineManager.sharedManager.lineWidth)
        
    }
    
    func addRightDivideLineWithDoubleInsets(inset: CGFloat) {
        addRightLineWithTopInset(inset, bottomInset: inset)
    }
    
    func addRightDivideLineWithTopInset(topInset: CGFloat) {
        addRightLineWithTopInset(topInset, bottomInset: 0)
    }
    
    func addRightDivideLineWithBottomInset(bottomInset: CGFloat) {
        addRightLineWithTopInset(0, bottomInset: bottomInset)
    }
    
    func addRightDivideLine() {
        addRightDivideLineWithDoubleInsets(0)
    }
}