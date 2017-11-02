//
//  Extension.swift
//  LoveCar
//
//  Created by mac on 2017/9/29.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class Extension: NSObject {
    
}

extension String{
    ///判断是否是正确的电话号码
    func isTelNumber() -> Bool {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
        let CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
        let CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        return ((regextestmobile.evaluate(with: self) == true)
                 || (regextestcm.evaluate(with: self) == true)
                 || (regextestct.evaluate(with: self) == true)
                 || (regextestcu.evaluate(with: self) == true))
    }
    /// 判断是否为正确的密码
    func isPassword() -> Bool{
        let password = "/^[a-zA-Z0-9]{6,20}$/"
        let regstestPass = NSPredicate.init(format: "SELF MATCHES %@", password)
        
        return regstestPass.evaluate(with: self)
    }
}

extension UIColor{
    
    convenience init(_ r : CGFloat, _ g : CGFloat, _ b : CGFloat) {
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(_ r : CGFloat, _ g : CGFloat, _ b : CGFloat, _ a : CGFloat) {
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
}

extension UIView{
    
    static func addTranslucentView(alpha: CGFloat, color: UIColor) -> UIView{
        
        let view = UIView.init(frame: kScreen_Bounds)
        view.alpha = alpha
        view.backgroundColor = color
        view.tag = 200
        
        return view
    }
}

extension UIAlertController{
    
    /// 添加一个普通提示框
    ///
    /// - Parameters:
    ///   - target: <#target description#>
    ///   - title: <#title description#>
    static func addNornalAlertController(target: AnyObject, title: String){
        let alertC = UIAlertController.init(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "确定", style: .cancel, handler: nil)
        alertC.addAction(action)
        target.present(alertC, animated: true, completion: nil)
    }
    
    /// 添加打电话的提示框
    ///
    /// - Parameters:
    ///   - target: <#target description#>
    ///   - phoneNumber: <#phoneNumber description#>
    static func addPhoneAlertController(target: UIViewController, phoneNumber: String){
        
        let alertC = UIAlertController.init(title: "拨打电话", message: phoneNumber, preferredStyle: .alert)
        
        let OK = UIAlertAction.init(title: "确定", style: .default) { (action) in
            
            UIApplication.shared.openURL(URL.init(string: "tel://" + phoneNumber)!)
        }
        let cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alertC.addAction(cancel)
        alertC.addAction(OK)
        
        target.present(alertC, animated: true, completion: nil)
    }
}

