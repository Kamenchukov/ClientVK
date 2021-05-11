//
//  AllCommunityCell.swift
//  VkClient
//
//  Created by Константин Каменчуков on 08.03.2021.
//

import UIKit

class AllCommunityCell: UITableViewCell {
  
    @IBOutlet weak var allCommunityCell : UILabel!
    @IBOutlet weak var picOfCommunity : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
