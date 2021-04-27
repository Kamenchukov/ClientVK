//
//  LoadingView.swift
//  VkClient
//
//  Created by Константин Каменчуков on 02.04.2021.
//

import UIKit

class LoadingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
//        let activityIndicatorView = UIActivityIndicatorView()
//        activityIndicatorView.startAnimating()
//        addSubview(activityIndicatorView)
//        activityIndicatorView.center = center
      
    }
    
    func loadingAnimation() {
        let rect1 = CGRect(x: 0, y: 0, width: 20, height: 20)
        let rect2 = CGRect(x: 25, y: 0, width: 20, height: 20)
        let rect3 = CGRect(x: 50, y: 0, width: 20, height: 20)
        
        let circleRect1 = UIView(frame: rect1)
        circleRect1.backgroundColor = .black
        circleRect1.layer.cornerRadius = circleRect1.frame.height / 2

       let circleRect2 = UIView(frame: rect2)
       circleRect2.backgroundColor = .black
       circleRect2.layer.cornerRadius = circleRect2.frame.height / 2

       let circleRect3 = UIView(frame: rect3)
        circleRect3.backgroundColor = .black
       circleRect3.layer.cornerRadius = circleRect3.frame.height / 2

        addSubview(circleRect1)
        addSubview(circleRect2)
        addSubview(circleRect3)

        UIView.animate(withDuration: 0.4, delay: 1.5, options: [.repeat, .autoreverse], animations: {
        circleRect1.alpha = 0.2})
        UIView.animate(withDuration: 0.4, delay: 1.7, options: [.repeat, .autoreverse], animations: {
                        circleRect2.alpha = 0.2})
        UIView.animate(withDuration: 0.4, delay: 1.9, options: [.repeat, .autoreverse], animations: {
                        circleRect3.alpha = 0.2})
    }
}
