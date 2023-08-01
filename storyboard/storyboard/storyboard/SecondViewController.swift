//
//  SecondViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/27.
//

import Foundation
import UIKit
import DLRadioButton

class SecondViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    let raorange = UIColor(named: "raorange")
    let dataSources :[String] = ["전체 약관에 동의합니다.", "서비스 이용약관(필수)" , "개인정보 수집 및 이용동의(필수)"]
    @IBOutlet weak var subtext: UILabel!

    @IBOutlet weak var ConfirmButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        ConfirmButton.isEnabled = false
        ConfirmButton.isHidden = false
        view.backgroundColor = .black
        subtext.text = "환영합니다.\n서비스 이용약관에 동의해주세요."
        subtext.font = UIFont.boldSystemFont(ofSize: 16)
        
        TableView.delegate = self
        TableView.dataSource = self
    }
    

}
