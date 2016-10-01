//
//  SDGSegmentButtonsView.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/1.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

protocol SDGSegmentButtonsViewProtocol {
    func segmentBtnDidSelected(at index: Int)
}

class SDGSegmentButtonsView: UIView, SDGLoadViewFromNibProtocol {
    
    var delegate: SDGSegmentButtonsViewProtocol?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    convenience init(with frame: CGRect) {
        self.init(frame: frame)
        loadViewFromNib()
    }

    @IBAction func segmentIndexSelected(_ sender: UISegmentedControl) {
        if let dlg = delegate { dlg.segmentBtnDidSelected(at: sender.selectedSegmentIndex) }
    }
}
