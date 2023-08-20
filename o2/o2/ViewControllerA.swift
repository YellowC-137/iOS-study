//
//  ViewController.swift
//  o2
//
//  Created by jsh on 2023/08/20.
//

import UIKit

class ViewControllerA: UIViewController {

    @IBOutlet weak var textA: UILabel!
    
    
    @IBAction func next(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyTableViewController") else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}

