//
//  MyClientTableViewCell.swift
//  iCar
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol MyClientTableViewCellDelegate {
    func callBtnClicked()
    func followBtnClicked()
    func taskBtnClicked()
}

class MyClientTableViewCell: UITableViewCell {

    var delegate: MyClientTableViewCellDelegate!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var clientTypeLabel: UILabel!//客户类型
    
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    //打电话
    @IBAction func callBtnAction(_ sender: UIButton) {
        self.delegate.callBtnClicked()
    }
    //新建跟进
    @IBAction func followBtnAction(_ sender: UIButton) {
        self.delegate.followBtnClicked()
    }
    //新建任务
    @IBAction func taskBtnAction(_ sender: UIButton) {
        self.delegate.taskBtnClicked()
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
