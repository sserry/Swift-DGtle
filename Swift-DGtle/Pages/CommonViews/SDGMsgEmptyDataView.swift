//
//  SDGMsgEmptyDataView.swift
//  Swift-DGtle
//
//  Created by apple on 2016/10/2.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

struct SDGEmptyDataViewModel {
    var title: String!
    var subTitle: String?
    var image: UIImage!
}

enum SDGEmptyDataType {
    case fav
    case friends
    case post
    case comment
    case like
    case message
}

class SDGMsgEmptyDataView: UIView, SDGLoadViewFromNibProtocol {
    
    
    @IBOutlet weak var emptyImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var viewModel: SDGEmptyDataViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            if let subTitle = viewModel.subTitle {
                subTitleLabel.text = subTitle
            } else {
                subTitleLabel.isHidden = true
            }
            emptyImageView.image = viewModel.image
        }
    }
    
    var dataType: SDGEmptyDataType = .fav 
    
    convenience init(with dataType: SDGEmptyDataType, frame: CGRect) {
        self.init(frame: frame)
        loadViewFromNib()
        self.dataType = dataType
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = GLOBAL_GRAY_LIGHT
        switch self.dataType {
        case .fav:
            viewModel = SDGEmptyDataViewModel(title: "", subTitle: nil, image: UIImage(named: "pic_addpost"))
            break
        case .friends:
            viewModel = SDGEmptyDataViewModel(title: "", subTitle: nil, image: UIImage(named: "pic_addpost"))
            break
        case .post:
            viewModel = SDGEmptyDataViewModel(title: "草稿箱暂无内容", subTitle: nil, image: UIImage(named: "pic_addpost"))
            break
        case .comment:
            viewModel = SDGEmptyDataViewModel(title: "暂未收到任何评论提醒", subTitle: "当你发布的内容被回复时，这里将会显示你所收到的通知", image: UIImage(named: "pic_comment_new"))
            break
        case .like:
            viewModel = SDGEmptyDataViewModel(title: "暂未收到任何点赞提醒", subTitle: "当你发布的内容被点赞时，这里将会收到你所收到的通知", image: UIImage(named: "pic_like"))
            break
        case .message:
            viewModel = SDGEmptyDataViewModel(title: "暂未收到私信提醒", subTitle: "遇见志同道合或让你欣赏的小伙伴？不如和 TA 用私信聊上几句吧", image: UIImage(named: "pic_message"))
            break
            
        }
    }

}
