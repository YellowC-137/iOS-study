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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return self.listm.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.listm[indexPath.row]
        // 셀을 생성하고 등록
        var cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "ListCell")
        }
        // 셀에 데이터 설정
        cell?.textLabel?.text = row.title
        return cell!
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
