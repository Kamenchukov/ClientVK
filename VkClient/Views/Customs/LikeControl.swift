//
//  LikeControl.swift
//  VkClient
//
//  Created by Константин Каменчуков on 17.03.2021.
//

import UIKit

@IBDesignable
class LikeControl: UIControl {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var title: UILabel?
    
    private var number: Int!
    private var isTapped: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        
    }
    
    // Mark: Actions
    
    @IBAction func TouchDown(_ sender: UIButton) {
        number = Int(title!.text ?? "0") ?? 0
        
        if isTapped {
            self.number -= 1
            sender.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            title?.textColor = UIColor.black
            likeAnimation()
            
        } else {
            self.number += 1
            sender.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            title?.textColor = UIColor.blue
            likeAnimation()
        }
        
        isTapped = !isTapped
        setText()
        likeAnimation()
    }
    
    private func likeAnimation() {
       let animation = CASpringAnimation(keyPath: "transform scale")
        
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        button.layer.add(animation, forKey:  nil)
    }
    
    private func setText() {
        var newLabelText = String(number)
        let thousand = number / 1000
        if thousand != 0 {
            newLabelText = "\(thousand)k..."
        }
        self.title?.text = newLabelText
    }
    
}
