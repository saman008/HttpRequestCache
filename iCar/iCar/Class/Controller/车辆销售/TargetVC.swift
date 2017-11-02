//
//  TargetVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import Charts


class TargetVC: UIViewController {

    let monthArray = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    let targetArray = ["￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万", "￥60万"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let w = (kScreen_W-3)/4
        let h = w
        layout.itemSize = CGSize.init(width: w, height: h)
//        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "TargetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TargetCollectionViewCell")
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.title = "目标"
        
        self.view.addSubview(collectionView)
    }
}

// MARK: - <#UICollectionViewDelegateFlowLayout, UICollectionViewDataSource#>
extension TargetVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: kScreen_W, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "TargetCollectionViewCell", for: indexPath) as! TargetCollectionViewCell
        
        item.monthLabel.text = monthArray[indexPath.row]
        item.moneyLabel.text = targetArray[indexPath.row]
        
        return item
    }
}

//extension TargetVC: JBBarChartViewDelegate, JBBarChartViewDataSource{
//    func numberOfBars(in barChartView: JBBarChartView!) -> UInt {
//        return 4
//    }
//    func barChartView(_ barChartView: JBBarChartView!, heightForBarViewAt index: UInt) -> CGFloat {
//        return 50
//    }
//}
//extension TargetVC: JBLineChartViewDelegate, JBLineChartViewDataSource{
//    func numberOfLines(in lineChartView: JBLineChartView!) -> UInt {
//        return 4
//    }
//    func lineChartView(_ lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
//        return 5
//    }
//    func lineChartView(_ lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
//        return 80
//    }
//}

