//
//  TableViewController.swift
//  o2
//
//  Created by jsh on 2023/08/21.
//

import Foundation
import UIKit

class MyTableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.titleLabel.text = "Item \(indexPath.row + 1)"
        
        // 체크박스 선택 시 토글 기능
        cell.checkboxButton.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    // 전체 선택 체크박스를 처리하는 메서드
    @IBAction func selectAllTapped(_ sender: UIButton) {
        for section in 0..<tableView.numberOfSections {
            for row in 0..<tableView.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)
                if let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell {
                    cell.checkboxButton.isSelected = true
                }
            }
        }
    }
    
    // 체크박스 선택 시 호출되는 메서드
    @objc func checkboxTapped(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? MyTableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            cell.toggleCheckbox()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
