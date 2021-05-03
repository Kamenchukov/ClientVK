//
//  FriendsViewCell.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit

class FriendsViewCell: UITableViewCell {
    @IBOutlet weak var friendCell: UILabel!
    
    @IBOutlet weak var friendFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
