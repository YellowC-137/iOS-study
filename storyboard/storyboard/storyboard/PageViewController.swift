//
//  PageViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/27.
//

import Foundation
import UIKit

class PageViewController : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return self
    }
    
    
}
