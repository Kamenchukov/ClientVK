//
//  BaseViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 02.04.2021.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var loadingView: LoadingView = {
        let view = LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        return view
    }()
    func showLoading() {
        view.addSubview(loadingView)
        loadingView.center = view.center
        loadingView.alpha = 0
        loadingView.loadingAnimation()
        
        UIView.animate(withDuration: 0.5){
            self.loadingView.alpha = 1
        }
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingView.alpha = 0
        }, completion: { _ in
            self.loadingView.removeFromSuperview()
        })
    }
    
 
    

   

}
