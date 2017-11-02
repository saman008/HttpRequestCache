//
//  AddClientVC.swift
//  iCar
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class AddClientVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "新建客户"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(saveAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.red
        
        
    }
}

extension AddClientVC{
    @objc func saveAction(){
        
    }
}
