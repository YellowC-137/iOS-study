//
//  ViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/25.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController{

    
    @IBOutlet weak var maintext: UILabel!

    @IBOutlet weak var SubView: UIView!

    @IBOutlet weak var cameratext: UITextField!
    
    @IBOutlet weak var WarningText: UILabel!
    @IBOutlet weak var QRText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        cameratext.font = UIFont.boldSystemFont(ofSize: 24)
        
        WarningText.text = "* 촬영된 이미지 및 정보는 이용 후 즉시\n삭제되며, 저장되지 않습니다."
    
        QRText.text = "QR코드 인식을 통한 인증을 위한\n 카메라 권한 사용"
        SubView.layer.cornerRadius = 24.0
        
    }
    //NavigationController

        
}

