//
//  ContactsHeaderView.swift
//  iCar
//
//  Created by mac on 2017/10/24.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol ContactsHeaderViewDelegate {
    func showBtnClicked(sender: UIButton)
}
class ContactsHeaderView: UITableViewHeaderFooterView {

    var delegate: ContactsHeaderViewDelegate!
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    
    @IBOutlet weak var showBtn: UIButton!
    @IBAction func showBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.delegate.showBtnClicked(sender: sender)
    }
    
}

