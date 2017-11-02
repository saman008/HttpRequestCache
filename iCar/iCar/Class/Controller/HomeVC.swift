//
//  HomeVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    let iconArray = ["", "", "", "", "", ""]
    let titleArray = ["我的客户", "车辆销售" ,"库存查询", "车辆调配", "培训资料", "我的分销", "通讯录"]
    var header: HomeHeaderView? = nil
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let w = (kScreen_W-1)/2
        let h = w * 147.5/187.5
        layout.itemSize = CGSize.init(width: w, height: h)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.register(UINib.init(nibName: "HomeHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.title = "销售管理系统"
        
        
        
        self.view.addSubview(collectionView)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = baseColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
    }
}

// MARK: - <#UICollectionViewDelegateFlowLayout, UICollectionViewDataSource#>
extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeHeaderView", for: indexPath) as? HomeHeaderView
        header?.delegate = self
        
        return header!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: kScreen_W, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        item.titleLabel.text = self.titleArray[indexPath.row]
        
        return item
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let clientC = MyClientVC()
            self.navigationController?.pushViewController(clientC, animated: true)
        case 1:
            let salesC = SalesVC()
            self.navigationController?.pushViewController(salesC, animated: true)
        case 2:
            let storageC = StorageVC()
            self.navigationController?.pushViewController(storageC, animated: true)
        case 3:
            let deployC = DeployVC()
            self.navigationController?.pushViewController(deployC, animated: true)
        case 4:
            let trainC = TrainVC()
            self.navigationController?.pushViewController(trainC, animated: true)
        case 5:
            let distributorC = MyDistributorVC()
            self.navigationController?.pushViewController(distributorC, animated: true)
        case 6:
            let contactsC = ContactsVC()
            self.navigationController?.pushViewController(contactsC, animated: true)
        default:
            break
        }
    }
}

// MARK: - <#HomeHeaderViewDelegate#>
extension HomeVC: HomeHeaderViewDelegate, CodeViewDelegate{
    func codeBtnClicked() {
        let codeView = UINib.init(nibName: "CodeView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CodeView
        codeView.frame = kScreen_Bounds
        codeView.delegate = self
        codeView.tag = 500
        
        UIApplication.shared.keyWindow?.addSubview(codeView)
    }
    
    func noticeBtnClicked() {
        let noticeC = NoticeVC()
        self.navigationController?.pushViewController(noticeC, animated: true)
    }
    
    func collectionViewDidselect(index: Int) {
        let detailC = NoticeDetailVC()
        self.navigationController?.pushViewController(detailC, animated: true)
    }
    
    //CodeViewDelegate
    func deleteBtnClicked() {
        UIApplication.shared.keyWindow?.viewWithTag(500)?.removeFromSuperview()
    }
}
