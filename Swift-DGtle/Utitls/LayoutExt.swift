//
//  LayoutExt.swift
//  designMan
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 mac. All rights reserved.
//

/**
 * snapKit布局辅助
 */
import UIKit

/**
 * 等宽
 */
extension UIView {
    
    /**
     * 与某一个视图等宽 约束顶部间距以及高度
     */
    func gg_equalWidth(withView aView: UIView!, TopOffset offset: CGFloat!, andHeight height: CGFloat!) {
        snp.makeConstraints { (make) in
            make.left.right.equalTo(aView)
            make.height.equalTo(height)
            make.top.equalTo(aView).offset(offset)
        }
    }
    
    /**
     * 与父视图等宽等顶 约束高度
     */
    func gg_equalWT(withHeight height: CGFloat) {
        guard superview != nil else {
            return
        }
        gg_equalWidth(withTopOffset: 0, andHeight: height)
    }
    
    /**
     * 与父视图等宽 约束顶部间距以及高度
     */
    func gg_equalWidth(withTopOffset offset: CGFloat!, andHeight height: CGFloat!) {
        guard superview != nil else {
            return
        }
        gg_equalWidth(withView: superview, TopOffset: offset, andHeight: height)
    }
    
    /**
     * 与某一个视图等宽等底 约束顶部间距
     */
    func gg_equalWB(withView aView: UIView!, topOffset offset: CGFloat!) {
        snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(aView)
            make.top.equalTo(aView).offset(offset)
        }
    }
    
    /**
     * 与父视图等宽等底 约束顶部间距
     */
    func gg_equalWB(withTopOffset offset: CGFloat!) {
        guard superview != nil else {
            return
        }
        gg_equalWB(withView: superview, topOffset: offset)
    }
    
    /**
     * 与父视图等宽等底 约束高度
     */
    func gg_equalWB(withHeight height: CGFloat!) {
        guard superview != nil else {
            return
        }
        snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(superview!)
            make.height.equalTo(height)
        }
    }
    
}

/**
 * 垂直居中
 */
extension UIView {
    
    /**
     * 与某一个视图垂直居中 约束宽高以及左右边距
     */
    func gg_centerY(withView aView: UIView!, aWidth: CGFloat?, height: CGFloat?, leftOffset: CGFloat?, rightOffset: CGFloat?) {
        snp.makeConstraints { (make) in
            make.centerY.equalTo(aView)
            if height != nil {
                make.height.equalTo(height!)
            }
            if leftOffset != nil {
                make.left.equalTo(aView).offset(leftOffset!)
            }
            if aWidth != nil {
                make.width.equalTo(aWidth!)
            }
            if rightOffset != nil {
                make.right.equalTo(aView).offset(rightOffset!)
            }
        }
    }
    
    /**
     * 与父视图垂直居中 约束宽高以及左右边距
     */
    func gg_centerY(withWidth width: CGFloat?, height: CGFloat?, leftOffset: CGFloat!, rightOffset: CGFloat?) {
        guard superview != nil else {
            return
        }
        gg_centerY(withView: superview!, aWidth: width, height: height, leftOffset: leftOffset, rightOffset: rightOffset)
    }
    
    /**
     * 与父视图垂直居中 约束宽高以及左边距
     */
    func gg_centerY(withLeftOffset leftOffset: CGFloat!, aWidth: CGFloat?, aHeight: CGFloat?) {
        gg_centerY(withWidth: aWidth, height: aHeight, leftOffset: leftOffset, rightOffset: nil)
    }
    
    /**
     * 与父视图垂直居中 约束宽高以及右边距
     */
    func gg_centerY(withRightOffset rightOffset: CGFloat!, aWidth: CGFloat?, aHeight: CGFloat?) {
        gg_centerY(withWidth: aWidth, height: aHeight, leftOffset: nil, rightOffset: rightOffset)
    }
    
    /**
     * 与父视图垂直居中 约束高以及左右边距
     */
    func gg_centerY(withLROffset leftOffset: CGFloat!, rightOffset: CGFloat!, height: CGFloat?) {
        gg_centerY(withWidth: nil, height: height, leftOffset: leftOffset, rightOffset: rightOffset)
    }

}


