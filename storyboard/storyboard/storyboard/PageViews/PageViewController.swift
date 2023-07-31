//
//  PageViewController.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/27.
//

import Foundation
import UIKit

class PageViewController : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    override var viewControllers: [UIViewController] {
        return [self.VCInstane(storyboardName: "PageViewOneController", vcName: "PageViewOneController"),
                self.VCInstane(storyboardName: "PageViewOneController", vcName: "PageViewOneController"),
                self.VCInstane(storyboardName: "PageViewOneController", vcName: "PageViewOneController"),
                self.VCInstane(storyboardName: "PageViewOneController", vcName: "PageViewOneController")]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = viewControllers.first{
            setViewControllers([firstVC], direction: .forward, animated: true,completion: nil)
        }
    }
    
    // 이전 페이지 뷰 컨트롤러 반환
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController), index > 0 else {
                return nil
            }
            return viewControllers[index - 1]
        }

        // 다음 페이지 뷰 컨트롤러 반환
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else {
                return nil
            }
            return viewControllers[index + 1]
        }
    
    private func VCInstane(storyboardName : String, vcName : String) ->UIViewController{
            return UIStoryboard(name : storyboardName, bundle : nil).instantiateViewController(withIdentifier: vcName)
        }

}

