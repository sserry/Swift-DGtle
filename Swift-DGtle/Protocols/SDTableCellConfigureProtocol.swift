//
//  SDTableCellConfigureProtocol.swift
//  Swift-DGtle
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 luminia. All rights reserved.
//

import UIKit

/** 
 *  Table View Cell Configuration Protocol
 */
protocol SDTableCellConfigureProtocol {
    
    associatedtype ModelType
    
    static var cellReuseIdentifier: String { get }
    func updateDataSource(_ modelSource: ModelType)
}

extension SDTableCellConfigureProtocol where Self: UITableViewCell {
    
    static func configureCellForTableView(_ tableView: UITableView, aModelSource: ModelType) -> Self {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier) as? Self
        if cell == nil  {
            cell = Self.init(style: .default, reuseIdentifier: self.cellReuseIdentifier)
        }
        cell!.updateDataSource(aModelSource)
        
        return cell!
    }
    
}

