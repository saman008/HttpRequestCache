//
//  AddTaskVC.swift
//  iCar
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "新建任务"
        self.textView.delegate = self
    }
}

extension AddTaskVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        hintLabel.isHidden = textView.text != ""
    }
}
