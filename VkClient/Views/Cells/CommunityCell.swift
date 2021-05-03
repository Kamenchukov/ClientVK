//
//  CommunityCell.swift
//  VkClient
//
//  Created by Константин Каменчуков on 07.03.2021.
//

import UIKit

class CommunityCell: UITableViewCell {
    
    @IBOutlet weak var communityCell : UILabel!
    @IBOutlet weak var picOfUserCommunity : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
