//
//  WXImageView.swift
//  movieFanDemo1
//
//  Created by mac on 2016/10/13.
//  Copyright © 2016年 冲击20K. All rights reserved.
//

import UIKit

class WXImageView: UIImageView {
    
    var target: AnyObject? = nil
    var action: Selector? = nil
    
    func addTarget(_ target: AnyObject, action: Selector){
        
        //打开用户交互
        self.isUserInteractionEnabled = true
        //保存数据
        self.target = target
        self.action = action
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.target != nil {
            
            self.target?.perform(self.action!, with: self)
        }
    }
    
    
}
