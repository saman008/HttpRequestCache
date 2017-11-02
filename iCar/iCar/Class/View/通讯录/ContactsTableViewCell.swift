//
//  ContactsTableViewCell.swift
//  iCar
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol ContactsTableViewCellDelegate {
    func callBtnClicked()
}

class ContactsTableViewCell: UITableViewCell {

//    var delegate: ContactsTableViewCellDelegate!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dutyLabel: UILabel!//职务
    
    @IBAction func callBtnAction(_ sender: UIButton) {
//        self.delegate.callBtnClicked()
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
