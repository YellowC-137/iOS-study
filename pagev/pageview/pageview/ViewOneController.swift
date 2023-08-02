//
//  ViewOneController.swift
//  pageview
//
//  Created by 황준성 on 2023/08/01.
//

import Foundation
import UIKit
class ViewOneController : UITableViewController{
    var data = [
        ("dddd","movie about d'ss","now","5.1"),("A","it's A","NEVER","0.0"),("dddd","movie about d'ss","now","5.1"),("A","it's A","NEVER","0.0")
    ]
    
    lazy var listm : [MovieVO] = {
        var datalist = [MovieVO]()
        for(title,detail,open,rate) in self.data {
            let mvo = MovieVO()
            mvo.title = title
            mvo.detail = detail
            mvo.open = open
            mvo.rate = rate
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {

    }
}
