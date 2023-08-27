//
//  ViewController.swift
//  scroll
//
//  Created by jsh on 2023/08/27.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let pageCount = 3  // 페이지 개수
    
    @IBOutlet weak var pc: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(pageCount), height: scrollView.frame.height)
        
        for pageIndex in 0..<pageCount {
            let pageView = UIView(frame: CGRect(x: scrollView.frame.width * CGFloat(pageIndex), y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
            
            let label = UILabel(frame: pageView.bounds)
            
            label.text = "image\(pageIndex + 1)"  // 이미지 이름을 적절히 변경
            
            pageView.addSubview(label)
            scrollView.addSubview(pageView)
            pc.numberOfPages = 3
        }
    }
    
    // UIScrollViewDelegate를 이용하여 페이지 변화를 감지할 수 있음
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 현재 페이지 계산
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pc.currentPage = currentPage
        print("Current Page: \(currentPage)")
    }
}


