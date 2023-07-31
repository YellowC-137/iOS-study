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

    @IBOutlet weak var subtext: UILabel!
    @IBOutlet weak var RadioAllButton: DLRadioButton!
    
    @IBOutlet weak var RadioButtonOne: DLRadioButton!
    
    @IBOutlet weak var RadioButtonTwo: DLRadioButton!
    
    @IBOutlet weak var SecondButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        subtext.text = "환영합니다.\n서비스 이용약관에 동의해주세요."
        subtext.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
}
