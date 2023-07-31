//
//  PageContainerViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/31.
//

import Foundation
import UIKit

class PageContainerViewController : UIViewController {
    
    var pageInstance : PageViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PageViewSegue"{
            pageInstance = segue.destination as? PageViewController
        }
    }
}
