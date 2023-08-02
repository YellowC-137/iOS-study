//
//  PageViewController.swift
//  pageview
//
//  Created by 황준성 on 2023/08/01.
//

import Foundation
import UIKit
class PageViewController : UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    var currentIndex : Int?
    var pendingIndex : Int?
    
    var isCheck:Bool = false{
        didSet{
            let imageName = isCheck ? "checkmark.square" : "checkmark.square.fill"
            //
        }
    }
    
    
    
    override func viewDidLoad() {
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = vcArr.first{
            setViewControllers([firstVC], direction: .forward, animated: true,completion: nil)
        }
    }

    lazy var indicator : UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .cyan
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.preferredIndicatorImage = UIImage(named: "pageIndicator_default")
         return pageControl
    }()
    
    
    lazy var vcArr : [UIViewController] = {
        return [self.vcInstance(name:"First" ),self.vcInstance(name: "Second"),self.vcInstance(name: "Third")]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = vcArr.firstIndex(of: pendingViewControllers.first!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                indicator.currentPage = index
            }
        }
    }
    
    func vcInstance(name:String) -> UIViewController {
        return UIStoryboard(name:"Main",bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcArr.firstIndex(of: viewController) else {return nil}
        
        let prevIndex = vcIndex - 1
        
        guard prevIndex >= 0 else {
            return nil
        }
        
        guard vcArr.count > prevIndex else {return nil}
        
        return vcArr[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcArr.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard nextIndex < vcArr.count else {
            return nil
        }
        
        guard vcArr.count > nextIndex else {return nil}
        
        return vcArr[nextIndex]
    }
}
