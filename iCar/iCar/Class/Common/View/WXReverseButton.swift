//
//  WXReverseButton.swift
//  CookRoom
//
//  Created by mac on 2017/6/5.
//  Copyright © 2017年 Mobisist. All rights reserved.
//

import UIKit

class WXReverseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.center.x = self.bounds.size.width/2
        if titleLabel?.text != "" {
            imageView?.frame.origin.x = ((titleLabel?.frame.size.width)! + (titleLabel?.frame.origin.x)!)
        }
        
    }
}
