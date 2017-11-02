//
//  PageCotentView.swift
//  搞你一笑
//
//  Created by mac on 2017/4/25.
//  Copyright © 2017年 成都大学. All rights reserved.
//

import UIKit

//MARK: - 代理1
protocol PageContentViewDelegate: class {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
}

class PageContentView: UIView {

    //默认子控制器
//    let defaultVcsCount = UserDefaults.standard.object(forKey: DEFAULT_CHILDVCS) as! Int
//    let defaultVcsCount: Int = 1
    
    fileprivate var isForbidScrollDelegate: Bool = false
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var childVcs: [UIViewController]
    //需要改成弱引用，否则循环引用
    fileprivate weak var parentVc: UIViewController?
    //MARK: 代理2
    weak var delegate: PageContentViewDelegate?
    
    // MARK: - 设置UI界面
    lazy var collectionView: UICollectionView = {
        
        //创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //创建collectionView
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        
        return collectionView
    }()
    
    init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        
        self.childVcs = childVcs
        self.parentVc = parentViewController
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func setupUI(){
        //添加所有控制器
        for childVc in childVcs {
            parentVc?.addChildViewController(childVc)
        }
        //添加collectionview
        addSubview(collectionView)
        collectionView.frame = bounds
    }
    
}

// MARK: - 实现collectionview的协议方法
extension PageContentView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    //delegate协议
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScrollDelegate = false
        startOffsetX = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //是点击传导过来的就不处理
        if isForbidScrollDelegate {return}
        
        //滚动处理
        var progress: CGFloat = 0
        var sourceIndex: Int = 0
        var targetIndex: Int = 0
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        if currentOffsetX > startOffsetX {//向左滑
            //floor函数是向下取整（即取不大于要求的最大整数）
            progress = currentOffsetX/scrollViewW - floor(currentOffsetX/scrollViewW)
            sourceIndex = Int(currentOffsetX/scrollViewW)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            //完全滑过去
            if currentOffsetX - startOffsetX == scrollViewW {
                progress = 1
                targetIndex = sourceIndex
            }
        }else{//向右滑
            progress = 1 - (currentOffsetX/scrollViewW - floor(currentOffsetX/scrollViewW))
            targetIndex = Int(currentOffsetX/scrollViewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
            //完全滑过去
            if startOffsetX - currentOffsetX == scrollViewW {
                sourceIndex = targetIndex
            }
        }
        
        //MARK: - 代理3
        delegate?.pageContentView( self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    //DataSource协议
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        
        //移除之前的
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        //取出控制器
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        
        return cell
    }
}
//MARK: - pageview的代理控制器会调用这里
extension PageContentView{
    func setCurrentOffset(currentIndex: Int){
        isForbidScrollDelegate = true
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: false)
    }
}

// MARK: - 公共方法，当添加或移除分类后，需要同步刷新PageContenView
//extension PageContentView{
//    
//    //MARK: 刷新自控制器
//    public func reloadChildVcs(newChildVcs: [UIViewController]) {
//        if self.childVcs.count < (defaultVcsCount + newChildVcs.count) {
//            for childVc in newChildVcs {
//                self.childVcs.append(childVc)
//                parentVc?.addChildViewController(childVc)
//            }
//        }else{
//            let count = self.childVcs.count - (defaultVcsCount + newChildVcs.count)
//            updateChildVcs(count: count)
//        }
//        UserDefaults.standard.set(childVcs.count, forKey: "")
//        collectionView.reloadData()
//    }
//    //MARK: - 没有添加频道或者移除了所有的频道，回到默认状态
//    public func setDefaultChildVcs(){
//        // 移除 "精彩推荐"和"全部直播"两个频道之外的所有频道控制器
//        // 当前子控制器个数 - 默认子控制个数 = 需要移除控制器的个数
//        let counts = self.childVcs.count - defaultVcsCount
//        updateChildVcs(count: counts)
//        UserDefaults.standard.set(self.childVcs.count, forKey: CHILDVCS)
//        collectionView.reloadData()
//    }
//    //MARK: - 更新控制器
//    func updateChildVcs(count: Int) {
//        var i = 0
//        let lastChildVcsCount = UserDefaults.standard.object(forKey: CHILDVCS) as! Int
//        
//        print("removecount-",count)
//        for _ in 0..<count {
//            self.childVcs.removeLast()
//        }
//        for childvc in (self.parentVc?.childViewControllers)! {
//            print("unremoveChildVC-",childvc)
//            print("i=", i)
//            if i > (lastChildVcsCount - count - 1) {
//                print("removechildVC",childvc)
//                childvc.removeFromParentViewController()
//            }
//            i += 1
//        }
//        for childs in self.childVcs {
//            parentVc?.addChildViewController(childs)
//        }
//    }
//}





















