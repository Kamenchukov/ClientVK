//
//  AvatarView.swift
//  VkClient
//
//  Created by Константин Каменчуков on 17.03.2021.
//

import UIKit

@IBDesignable
class AvatarView: UIView {


    
    var image : UIImage? {
        didSet {
            imageView?.removeFromSuperview()
            imageView = UIImageView(image: image)
            setup()
        }
    }
    private var imageView : UIImageView?
    open var imageName: URL? {
        didSet {
            if let image = imageName,
               let data = try? Data(contentsOf: image) {
                imageView?.image = UIImage(data: data)
            } else {
                imageView?.image = UIImage(systemName: "person.corp.circle")
            }
        }
    }
    @IBInspectable
    var shadowOpacity : Float = 0.7 {
        didSet {
            setup()
        }
    }
    
    
    @IBInspectable
    var shadowRadius : CGFloat = 4 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    var shadowColor : UIColor = UIColor.black {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        layer.backgroundColor = UIColor.white.cgColor
        let cornerRadius = min(self.bounds.size.height / 2, self.bounds.size.width / 2)
        layer.cornerRadius = cornerRadius
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
        guard let imageView = imageView else {return}
        imageView.makeRonded(cornerRadius: cornerRadius)
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        imageView?.frame = bounds
    }
    

}
