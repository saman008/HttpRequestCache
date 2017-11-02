//
//  WXVerticalButton.swift
//  CookRoom
//
//  Created by mac on 2017/5/29.
//  Copyright © 2017年 Mobisist. All rights reserved.
//

import UIKit

class WXVerticalButton: UIButton {

    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        super.imageRect(forContentRect: contentRect)
        let imageX = self.frame.size.width/4
        let imageY = self.frame.size.width/5
        let imageW = self.frame.size.width/2
        let imageH = self.frame.size.height * 2/5
        
        return CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
        
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        super.titleRect(forContentRect: contentRect)
        let titleX: CGFloat = 0
        let titleY = self.frame.size.height * 3/5 + 5
        let titleW = self.frame.size.width
        let titleH = self.frame.size.height/5
        
        return CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
