//
//  CodeView.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
protocol CodeViewDelegate {
    func deleteBtnClicked()
}

class CodeView: UIView {

    var delegate: CodeViewDelegate!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var codeImage: UIImageView!
    
    
    
    
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        self.delegate.deleteBtnClicked()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(deleteBtnAction(_:)))
        bgView.addGestureRecognizer(tapGes)
    }
    
}
