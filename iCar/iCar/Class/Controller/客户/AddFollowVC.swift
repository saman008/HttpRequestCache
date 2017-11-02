//
//  AddFollowVC.swift
//  iCar
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import TZImagePickerController

class AddFollowVC: UIViewController {

    var photos = [UIImage]()
    var assats = [Any]()
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var statusLabel: UILabel!//客户状态
    @IBOutlet weak var imgcontentView: UIView!
    @IBOutlet weak var imgCountentViewH: NSLayoutConstraint!
    
    
    @IBAction func photographBtnAction(_ sender: UIButton) {
        
    }
    @IBAction func imgBtnAction(_ sender: UIButton) {
        let pickerC = TZImagePickerController.init(maxImagesCount: 6, delegate: self)
        pickerC?.selectedAssets =  NSMutableArray.init(array: self.assats)
        self.present(pickerC!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "新建更进"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(rightItemAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.red
        
        self.textView.delegate = self
        
    }
    ///在存放图片的view上添加图片视图组件
    func setPhotos(images: [UIImage]){
        //先将存放图片的视图清除掉
        self.view.viewWithTag(500)?.removeFromSuperview()
        //创建图片视图
        let bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: 0))//使其宽度高度相等
        bgView.backgroundColor = UIColor.white
        bgView.tag = 500
        //根据图片数量计算容器视图的高度
        let imgW = (kScreen_W - 4*kMargin)/3
        let imgH = imgW
        if images.count == 0 {bgView.frame.size.height = 0}
        else if images.count <= 3 {bgView.frame.size.height = imgH + 2*kMargin}
        else if images.count <= 6 {bgView.frame.size.height = 2*imgH + 3*kMargin}
        else if images.count <= 9 {bgView.frame.size.height = 3*imgH + 4*kMargin}
//        self.imgcontentView.frame.size.height = bgView.frame.size.height
        self.imgCountentViewH.constant = bgView.frame.size.height
        //添加图片
        for i in 0..<images.count {
            let imgW = (kScreen_W - 4*kMargin)/3
            let imgH = imgW
            let imgX = kMargin + CGFloat(i%3)*(kMargin + imgW)
            let imgY = kMargin + CGFloat(i/3)*(kMargin + imgH)
            let imageBtn = UIButton.init(frame: CGRect.init(x: imgX, y: imgY, width: imgW, height: imgH))//创建一个图片按钮（显示图片的按钮）
            imageBtn.tag = 600 + i
            imageBtn.setImage(images[i], for: .normal)
            imageBtn.addTarget(self, action: #selector(chackBigImage(sender:)), for: .touchUpInside)
            bgView.addSubview(imageBtn)
            
            let deleteBtn = UIButton.init(frame: CGRect.init(x: imgW - 20, y: 0, width: 20, height: 20))
            deleteBtn.tag = 700 + i
            deleteBtn.setImage(UIImage.init(named: "微博"), for: .normal)
            deleteBtn.addTarget(self, action: #selector(deleteBtnAction(btn:)), for: .touchUpInside)
            imageBtn.addSubview(deleteBtn)
        }
        
        self.imgcontentView.addSubview(bgView)
    }
}
extension AddFollowVC{
    @objc func rightItemAction(){
        
    }
    @objc func deleteBtnAction(btn: UIButton){
        self.photos.remove(at: btn.tag - 700)
        self.assats.remove(at: btn.tag - 700)
        var imageArray = [UIImage]()
        for item in self.photos {
            imageArray.append(item)
        }
        
        setPhotos(images: imageArray)
    }
    @objc func chackBigImage(sender: UIButton){
        
        let bigImageC = TZImagePickerController.init(selectedAssets: NSMutableArray.init(array: assats), selectedPhotos: NSMutableArray.init(array: photos), index: sender.tag - 600)
        bigImageC?.isSelectOriginalPhoto = false//不是原图
        bigImageC?.didFinishPickingPhotosHandle = { (photos, assats, isSelectOriginalPhoto) in
            self.photos = photos!
            self.assats = assats!
            self.setPhotos(images: photos!)
        }
        self.present(bigImageC!, animated: true, completion: nil)
    }
}
extension AddFollowVC: TZImagePickerControllerDelegate{
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        self.photos = photos!
        self.assats = assets!
        setPhotos(images: photos)
    }
}
extension AddFollowVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        hintLabel.isHidden = textView.text != ""
    }
}
