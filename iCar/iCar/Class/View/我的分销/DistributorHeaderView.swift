//
//  DistributorHeaderView.swift
//  iCar
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol DistributorHeaderViewDelegate {
    func saleBtnClicked()
    func royaltiesBtnClicked()
}

class DistributorHeaderView: UIView {

    var delegate: DistributorHeaderViewDelegate!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var royaltiesLabel: UILabel!
    
    
    @IBAction func saleBtnAction(_ sender: UIButton) {
        self.delegate.saleBtnClicked()
    }
    @IBAction func royaltiesBtnAction(_ sender: UIButton) {
        self.delegate.royaltiesBtnClicked()
    }
    
    

}
