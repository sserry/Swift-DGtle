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
    func gg_equalWidthLayoutWithView(_ aView: UIView!, TopOffset offset: CGFloat!, andHeight height: CGFloat!) {
        snp_makeConstraints { (make) in
            make.left.right.equalTo(aView)
            make.height.equalTo(height)
            make.top.equalTo(aView).offset(offset)
        }
    }
    
    /**
     * 与父视图等宽 约束顶部间距以及高度
     */
    func gg_equalWidthLayoutWithTopOffset(topOffset offset: CGFloat!, andHeight height: CGFloat!) {
        guard superview != nil else {
            return
        }
        gg_equalWidthLayoutWithView(superview, TopOffset: offset, andHeight: height)
    }
    
    /**
     * 与某一个视图等宽等底 约束顶部间距
     */
    func gg_equalWBLayoutWithView(_ aView: UIView!, topOffset offset: CGFloat!) {
        snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(aView)
            make.top.equalTo(aView).offset(offset)
        }
    }
    
    /**
     * 与父视图等宽等底 约束顶部间距
     */
    func gg_equalWBLayoutWithTopOffset(_ offset: CGFloat!) {
        guard superview != nil else {
            return
        }
        gg_equalWBLayoutWithView(superview, topOffset: offset)
    }
    
    /**
     * 与父视图等宽等底 约束高度
     */
    func gg_equalWBLayoutWithHeight(_ height: CGFloat!) {
        guard superview != nil else {
            return
        }
        snp_makeConstraints { (make) in
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
    func gg_centerYLayoutWithView(_ aView: UIView!, aWidth: CGFloat?, height: CGFloat?, leftOffset: CGFloat?, rightOffset: CGFloat?) {
        snp_makeConstraints { (make) in
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
    func gg_centerYLayout(_ aWidth: CGFloat?, height: CGFloat?, leftOffset: CGFloat!, rightOffset: CGFloat?) {
        guard superview != nil else {
            return
        }
        gg_centerYLayoutWithView(superview!, aWidth: aWidth, height: height, leftOffset: leftOffset, rightOffset: rightOffset)
    }
    
    /**
     * 与父视图垂直居中 约束宽高以及左边距
     */
    func gg_centerYLayoutWithLeftOffset(_ leftOffset: CGFloat!, aWidth: CGFloat?, aHeight: CGFloat?) {
        gg_centerYLayout(aWidth, height: aHeight, leftOffset: leftOffset, rightOffset: nil)
    }
    
    /**
     * 与父视图垂直居中 约束宽高以及右边距
     */
    func gg_centerYLayoutWithRightOffset(_ rightOffset: CGFloat!, aWidth: CGFloat?, aHeight: CGFloat?) {
        gg_centerYLayout(aWidth, height: aHeight, leftOffset: nil, rightOffset: rightOffset)
    }
    
    /**
     * 与父视图垂直居中 约束高以及左右边距
     */
    func gg_centerYLayoutWithLROffset(_ leftOffset: CGFloat!, rightOffset: CGFloat!, height: CGFloat?) {
        gg_centerYLayout(nil, height: height, leftOffset: leftOffset, rightOffset: rightOffset)
    }

}


