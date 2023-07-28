//
//  ViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/25.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        var label = UILabel()
        
    }
    //NavigationController
    
    @IBAction func Button_Clicked(_ sernder: UIButton){
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .flipHorizontal
        self.present(vcName!, animated: true, completion: nil)
        
        
    }
        


}

