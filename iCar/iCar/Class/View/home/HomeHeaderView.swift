//
//  HomeHeaderView.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import SDCycleScrollView

fileprivate let textArray = ["选择更多、性价比更高！你来这里看遍全程所有4s店！更多选择、更多对比，让你看个够", "这里的车非常牛逼", "霸气的车车，你值得拥有"]

protocol HomeHeaderViewDelegate {
    func codeBtnClicked()
    func noticeBtnClicked()
    func collectionViewDidselect(index: Int)
}
class HomeHeaderView: UICollectionReusableView {

    var delegate: HomeHeaderViewDelegate!
    var timer: Timer? = nil
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var clientCountLabel: UILabel!
    @IBOutlet weak var carCountLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    ///二维码按钮点击
    @IBAction func codeBtnAction(_ sender: UIButton) {
        self.delegate.codeBtnClicked()
    }
    ///公告按钮点击
    @IBAction func noticeBtnAction(_ sender: UIButton) {
        self.delegate.noticeBtnClicked()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.contentOffset.y = 5000*self.collectionView.frame.size.height
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(nextNotice), userInfo: nil, repeats: true)
       
    }
    @objc func nextNotice(){
        self.collectionView.setContentOffset(CGPoint.init(x: 0, y: self.collectionView.contentOffset.y + self.collectionView.frame.size.height), animated: true)
    }
    
}

extension HomeHeaderView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        item.viewWithTag(500)?.removeFromSuperview()
        
        let label = UILabel.init(frame: item.bounds)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.tag = 500
        label.text = textArray[indexPath.row%3]
        item.addSubview(label)
        return item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.collectionViewDidselect(index: indexPath.row)
    }
}

