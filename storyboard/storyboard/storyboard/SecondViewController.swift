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
    @IBOutlet weak var text1: UILabel!

    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        text1.text = "환영합니다.\n서비스 이용약관에 동의해주세요."
        text1.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
}
