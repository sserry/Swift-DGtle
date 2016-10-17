//
//  SDGGuideView.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/14.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

class SDGGuideView: UIScrollView {

    fileprivate let pageControl = UIPageControl()
    fileprivate let imgArr: [UIImage] = {
        let sufix = SCREEN_WIDTH == 320 ? "-ip5"
                    : SCREEN_WIDTH == 375 ? "-ip6p"
                    : "-ip6p"
        let arr = [UIImage(named: "guide01\(sufix)"),
                   UIImage(named: "guide02\(sufix)"),
                   UIImage(named: "guide03\(sufix)")]
        return arr as! [UIImage]
    }()
    
    init() {
        super.init(frame: SCREEN_SIZE)
        for i in imgArr.indices {
            let imgView = UIImageView(image: imgArr[i])
            imgView.frame = CGRect(x: 0 + CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            addSubview(imgView)
            
            if i == 2 {
                
                imgView.isUserInteractionEnabled = true
                
                let tapGR = UITapGestureRecognizer(target: self, action: #selector(SDGGuideView.disappearWithTap(_:)))
                imgView.addGestureRecognizer(tapGR)
                
                let swipeGR = UISwipeGestureRecognizer(target: self, action: #selector(SDGGuideView.disappearWithSwipe(_:)))
                swipeGR.direction = .left
                swipeGR.delegate = self
                imgView.addGestureRecognizer(swipeGR)
            }
        }
        contentSize = CGSize(width: SCREEN_WIDTH * 3, height: SCREEN_HEIGHT)
        isPagingEnabled = true
        bounces = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        pageControl.numberOfPages = imgArr.count
        pageControl.isUserInteractionEnabled = false
        superview?.addSubview(pageControl)
        superview?.bringSubview(toFront: pageControl)
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(40)
            $0.height.equalTo(5)
        }
        
    }
    
}


// MARK: - scroll view delegate
extension SDGGuideView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / SCREEN_WIDTH)
    }

}


// MARK: - 事件
extension SDGGuideView {
    func disappearWithTap(_ sender: UITapGestureRecognizer) {
        dispearBasket()
    }
    
    func disappearWithSwipe(_ sender: UISwipeGestureRecognizer) {
        dispearBasket()
    }
    
    func dispearBasket() {
        // 500ms
        
        setHasRun()
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.pageControl.alpha = 0
            self.alpha = 0
            }) { [unowned self] _ in
                self.pageControl.removeFromSuperview()
                self.removeFromSuperview()
                
        }
    }

}

// MARK: - UIGestureRecognizerDelegate
extension SDGGuideView: UIGestureRecognizerDelegate {
    // 滑动手势冲突
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UISwipeGestureRecognizer && otherGestureRecognizer is UIPanGestureRecognizer {
            return true
        }
        return false
    }
}
