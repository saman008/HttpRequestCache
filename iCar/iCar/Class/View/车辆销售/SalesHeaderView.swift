//
//  SalesHeaderView.swift
//  iCar
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol SalesHeaderViewDelegate {
    func saleBtnClicked()
    func royaltiesBtnClicked()
    func targetBtnClicked()
}

class SalesHeaderView: UIView {

    var delegate: SalesHeaderViewDelegate!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var saleMoneyLabel: UILabel!//销售业绩
    @IBOutlet weak var royaltiesLabel: UILabel!//提成
    @IBOutlet weak var targetlabel: UILabel!//目标
    
    @IBAction func saleBtnAction(_ sender: UIButton) {
        self.delegate.saleBtnClicked()
    }
    @IBAction func royaltiesBtnAction(_ sender: UIButton) {
        self.delegate.royaltiesBtnClicked()
    }
    @IBAction func targetBtnAction(_ sender: UIButton) {
        self.delegate.targetBtnClicked()
    }
    
    
    
    
    
    
}
