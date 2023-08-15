//
//  TableViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/08/01.
//

import Foundation
import UIKit

class TableViewController : UITableViewController {
    
    var items: [Item] = [
        Item(title: "전체 약관에 동의합니다", isSelected: false),
        Item(title: "서비스 이용약관 (필수)", isSelected: false),
        Item(title: "개인정보 수집 및 이용동의 (필수)", isSelected: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isSelected ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let isSelected = !items[0].isSelected
            for i in 1..<items.count {
                items[i].isSelected = isSelected
            }
        } else {
            items[indexPath.row].isSelected.toggle()
            items[0].isSelected = items.dropFirst().allSatisfy { $0.isSelected }
        }
        
        tableView.reloadData()
    }
}



    
  



struct Item {
    var title: String
    var isSelected: Bool
}
