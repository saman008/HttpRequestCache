//
//  StorageTableViewCell.swift
//  iCar
//
//  Created by mac on 2017/10/25.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class StorageTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!//店铺
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
