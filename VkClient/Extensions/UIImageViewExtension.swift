//
//  UIImageViewExtension.swift
//  VkClient
//
//  Created by Константин Каменчуков on 21.03.2021.
//

import UIKit

extension UIImageView {
    
    func makeRonded(cornerRadius : CGFloat) {
        self.layer.borderWidth = 0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
