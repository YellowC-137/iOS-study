//
//  TableViewCell.swift
//  o2
//
//  Created by jsh on 2023/08/21.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // 체크박스 선택 여부를 토글하는 메서드
    func toggleCheckbox() {
        checkboxButton.isSelected = !checkboxButton.isSelected
    }
}
