//
//  DistributorTableViewCell.swift
//  iCar
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol DistributorTableViewCellDelegate {
    func callBtnClicked()
}

class DistributorTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBAction func callBtnAction(_ sender: UIButton) {
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.icon.layer.masksToBounds = true
        self.icon.layer.cornerRadius = icon.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
