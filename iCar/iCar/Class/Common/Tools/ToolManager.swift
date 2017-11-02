//
//  ToolManager.swift
//  LoveCar
//
//  Created by mac on 2017/9/29.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

let AppName = ""
//常用属性
let kScreen_Bounds = UIScreen.main.bounds
let kScreen_Size = UIScreen.main.bounds.size
let kScreen_W = UIScreen.main.bounds.size.width
let kScreen_H = UIScreen.main.bounds.size.height
let kScreenViewH = kScreen_H - kNavigationBarH//该APP没有tabBar

let kNavigationBarH = UIApplication.shared.statusBarFrame.size.height + 44//iPhone X的状态栏高度为38，所以不能写20
let kMargin: CGFloat = 10
let kMediumMargin: CGFloat = 5
let kMinMargin: CGFloat = 1
let kMaxMargin: CGFloat = 20
let kNormalRadio: CGFloat = 5

//基准颜色
let baseColor = UIColor.init(237, 34, 0)
//占位图
let placeHolderImage = "占位图"
let Token_Key = "token"
var Token_Value = ""

class ToolManager: NSObject {}

extension ToolManager{
    
    /// 计算字符串的尺寸大小
    ///
    /// - Parameters:
    ///   - str: 需要计算的字符串
    ///   - maxW: 最大宽度
    ///   - maxH: 最大高度
    ///   - attributes: 字符串属性
    /// - Returns: CGSize
    static func calculateStringSize(str: String, maxW: CGFloat, maxH: CGFloat, attributes: [NSAttributedStringKey: Any]?) -> CGSize{
        
        let ocStr = str as NSString
        let size = ocStr.boundingRect(with: CGSize.init(width: maxW, height: maxH), options: .usesLineFragmentOrigin, attributes: attributes!, context: nil).size
        return size
    }
}



