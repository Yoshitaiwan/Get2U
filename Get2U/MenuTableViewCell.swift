//
//  MenuTableViewCell.swift
//  Get2U
//
//  Created by Yoshi on 6/4/17.
//  Copyright © 2017 Yoshi. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var itemLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var DescriptionLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
