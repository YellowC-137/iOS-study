//
//  RoundBtn.swift
//  storyboard
//
//  Created by 황준성 on 2023/07/26.
//

import Foundation
import UIKit

class RoundButton: UIView {
    
    weak var delegate: CustomViewDelegate?
    
    @objc func didTapView(){
        delegate?.didTapCustomView(self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    
    private func setupButton() {
        // Auto layout, variables, and unit scale are not yet supported
        var view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 343, height: 60)
        var shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 100)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.14).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 8
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 100)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 4
        layer1.shadowOffset = CGSize(width: 0, height: 0)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)

        var shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)

        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 1, green: 0.404, blue: 0, alpha: 1).cgColor
        layer2.bounds = shapes.bounds
        layer2.position = shapes.center
        shapes.layer.addSublayer(layer2)

        shapes.layer.cornerRadius = 100

     
        addSubview(view)

        
    }
}
