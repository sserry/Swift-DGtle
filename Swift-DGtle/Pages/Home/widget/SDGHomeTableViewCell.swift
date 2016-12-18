//
//  SDGHomeTableViewCell.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit
import Kingfisher

class SDGHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var aurthorAvatar: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var articleBanner: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleIntro: UILabel!
    @IBOutlet weak var articleCategory: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var recommendedCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    
    @IBOutlet weak var tagView: UIView!
    
    
    var dataSource: JSON? {
        didSet {
            guard dataSource != nil else {
                return
            }
            
            authorName.text = dataSource?["author"].stringValue
            articleTitle.text = dataSource?["title"].stringValue
            articleIntro.text = dataSource?["summary"].stringValue
            
            let url = URL(string: dataSource!["pic_url"].stringValue)
            articleBanner.kf.setImage(with: url,
                                      placeholder: SDGPlaceHolder.BANNER_PLACEHOLDER)
            
            let avatarUrl = URL(string: SDGAPI.middleAvatar(dataSource!["authorid"].stringValue))
            aurthorAvatar.kf.setImage(with: avatarUrl, placeholder: SDGPlaceHolder.BANNER_PLACEHOLDER)
            
            commentCount.text = dataSource?["commentnum"].stringValue
            recommendedCount.text = dataSource?["recommend_add"].stringValue
            
            commentCount.isHidden = commentCount.text == "0"
            recommendedCount.isHidden = recommendedCount.text == "0"
            
//            categoryIcon.kf.setImage(with: <#T##Resource?#>, placeholder: <#T##Image?#>, options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(Int64, Int64) -> ()#>, completionHandler: <#T##CompletionHandler?##CompletionHandler?##(Image?, NSError?, CacheType, URL?) -> ()#>)
            articleCategory.text = dataSource?["catid"].stringValue
            
            let isLive = dataSource?["tag_name"].stringValue != ""
            tagView.isHidden = !isLive
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension SDGHomeTableViewCell: SDTableCellConfigureProtocol {
    
    static var cellReuseIdentifier: String {
        return "SDG_HOME_TABLE_CELL_REUSED_ID"
    }
    
    func updateDataSource(_ modelSource: JSON?) {
        self.dataSource = modelSource
    }
    
}
