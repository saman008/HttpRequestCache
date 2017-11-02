//
//  HttpTool.swift
//  LoveCar
//
//  Created by mac on 2017/9/29.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class HttpTool: NSObject {
    
    static func get(url: String, paras: Parameters?, success: @escaping(_ json: [String:AnyObject])->(), failure: @escaping(_ error:NSError)->()){
        Alamofire.request(url, method: .get, parameters: paras, encoding: URLEncoding.default, headers: nil).downloadProgress { (progress) in
            print("请求进度\(progress)")
            }.responseJSON { (response) in
                SVProgressHUD.dismiss()
                switch response.result{
                case .success(_):
                    if let value = response.result.value as? [String: AnyObject]{
                        success(value)
                    }
                case .failure(let error):
                    failure(error as NSError)
                }
        }
    }
    static func post(url: String, paras: Parameters?, success: @escaping(_ json: [String: AnyObject])->(), failure: @escaping(_ error:NSError)->()){
        Alamofire.request(url, method: .get, parameters: paras, encoding: URLEncoding.default, headers: nil).downloadProgress { (progress) in
            print("请求进度\(progress)")
            }.responseJSON { (response) in
                SVProgressHUD.dismiss()
                switch response.result{
                case .success(_):
                    if let value = response.result.value as? [String: AnyObject]{
                        success(value)
                    }
                case .failure(let error):
                    failure(error as NSError)
                }
        }
    }
    static func postWithJsonEncoding(url: String, paras: Parameters?, success: @escaping(_ json: [String: AnyObject])->(), failure: @escaping(_ error:NSError)->()){
        Alamofire.request(url, method: .get, parameters: paras, encoding: JSONEncoding.default, headers: nil).downloadProgress { (progress) in
            print("请求进度\(progress)")
            }.responseJSON { (response) in
                SVProgressHUD.dismiss()
                switch response.result{
                case .success(_):
                    if let value = response.result.value as? [String: AnyObject]{
                        success(value)
                    }
                case .failure(let error):
                    failure(error as NSError)
                }
        }
    }
    
    /// 上传图片和参数
    ///
    /// - Parameters:
    ///   - url: url
    ///   - paras: 参数
    ///   - imageName: 图片名（图片参数名）
    ///   - images: 图片数组
    ///   - success: 成功回调
    ///   - failture: 失败回调
    static func upload(url: String, paras: [String: AnyObject]?, imageName: String, images: [UIImage], success:@escaping (_ json:[String:AnyObject])->(), failture: @escaping(_ error: NSError)->()){
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for i in 0..<images.count{
                let imageData = UIImageJPEGRepresentation(images[i], 0.5)
                multipartFormData.append(imageData!, withName: imageName, fileName: imageName, mimeType: "image/jpeg")
            }
            // 这里就是绑定参数的地方 param 是需要上传的参数，我这里是封装了一个方法从外面传过来的参数，你可以根据自己的需求用NSDictionary封装一个param
            if paras != nil{
                for (key, value) in paras! {
                    
                    let data = value as AnyObject
                    multipartFormData.append(data.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        }, to: url, headers: nil) { (encodingResult) in
            SVProgressHUD.dismiss()
            switch encodingResult{
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.uploadProgress(closure: { (progress) in
                    print("上传进度\(progress)")
                    
                }).responseJSON(completionHandler: { (response) in
                    if let value = response.result.value as? [String:AnyObject]{
                        success(value)
                    }
                })
            case .failure(let error):
                failture(error as NSError)
            }
        }
    }
}
