//
//  NewsCell.swift
//  VkClient
//
//  Created by Константин Каменчуков on 28.03.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var bigPic: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLabel?.numberOfLines = 0
    
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
