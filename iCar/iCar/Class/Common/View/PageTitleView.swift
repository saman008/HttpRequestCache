//
//  PageTitleView.swift
//  搞你一笑
//
//  Created by mac on 2017/4/25.
//  Copyright © 2017年 成都大学. All rights reserved.
//

import UIKit

// MARK: - 代理1
protocol PageTitleViewDelegate: class {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int)
}

class PageTitleView: UIView {

//    var isScrollEnable: Bool!
    var titlesArray = [String]()
    var imagesArray = [UIImage]()
    var selectedImagesArray = [UIImage]()
    
    fileprivate var titleBtnArray = [UIButton]()
    
    fileprivate var normalTitleColor = UIColor.darkGray //默认颜色
    fileprivate var selectTitleColor = UIColor.red      //默认选中颜色
    
    fileprivate var scrollLine_H: CGFloat = 2
    fileprivate var currentBtnIndex: Int = 0
    fileprivate var bottomLine_H: CGFloat = 0.5
    
    // MARK: - 代理2
    weak var delegate: PageTitleViewDelegate?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false//点击状态栏是否回到顶部
        scrollView.bounces = true
        scrollView.backgroundColor = UIColor.white
        
        return scrollView
    }()
    lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = self.selectTitleColor
        return scrollLine
    }()
    init(frame: CGRect, titlesArray: [String], normalTitleColor: UIColor, selectTitleColor: UIColor) {
        
        super.init(frame: frame)
        
        self.titlesArray = titlesArray
        self.normalTitleColor = normalTitleColor
        self.selectTitleColor = selectTitleColor
        
        setupTitleBtn()
    }
    
    init(frame: CGRect, titlesArray: [String], imagesArray: [UIImage], selectedImagesArray: [UIImage], normalTitleColor: UIColor, selectTitleColor: UIColor) {
        super.init(frame: frame)
        
        self.titlesArray = titlesArray
        self.imagesArray = imagesArray
        self.selectedImagesArray = selectedImagesArray
        self.normalTitleColor = normalTitleColor
        self.selectTitleColor = selectTitleColor
        
        setupTitleBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupTitleBtn(){
        let btnY: CGFloat = 0
        let btnH: CGFloat = bounds.height - scrollLine_H - bottomLine_H
        let count = titlesArray.count
        
        for (i, title) in titlesArray.enumerated() {
            
            let btn = UIButton()
            //设置按钮属性
            btn.tag = i
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(normalTitleColor, for: .normal)
            btn.setTitleColor(selectTitleColor, for: .selected)
            btn.addTarget(self, action: #selector(titleBtnClick(button:)), for: .touchUpInside)
            //设置按钮图片
            if imagesArray.count>=titlesArray.count {
                btn.setImage(imagesArray[i], for: .normal)
            }
            if selectedImagesArray.count >= titlesArray.count {
                btn.setImage(selectedImagesArray[i], for: .selected)
            }
            titleBtnArray.append(btn)
            //设置按钮的frame
            var btnW = bounds.width/CGFloat(count)
            //当title超过5个时，则从新设置按钮的布局
            if count > 5 {
                btnW = bounds.width/5
            }
            let btnX = CGFloat(i) * btnW
            btn.frame = CGRect.init(x: btnX, y: btnY, width: btnW, height: btnH)
            //设置按钮是否被选中
            if i == 0 {
                btn.isSelected = true
            }else{
                btn.isSelected = false
            }
            self.addSubview(btn)
        }
        
    }
    
    /// 添加底部线条和滑块
 func setupBottomlineAndScrollline(){
        //添加底部线条（长线条  可要可不要）
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.gray
        bottomLine.frame = CGRect.init(x: 0, y: self.bounds.height - bottomLine_H, width: bounds.width, height: bottomLine_H)
        bottomLine.backgroundColor = UIColor.lightGray
        self.addSubview(bottomLine)
        
        //添加滑块
        addSubview(scrollLine)
        guard let firstLable = titleBtnArray.first else {return}
        
        let lineX = firstLable.frame.origin.x
        let lineY = bounds.height - scrollLine_H - bottomLine_H
        let lineW = firstLable.frame.width * 0.8
        let lineH = scrollLine_H
        scrollLine.frame = CGRect.init(x: lineX, y: lineY, width: lineW, height: lineH)
        
    }
    
    /// 点击事件
    @objc fileprivate func titleBtnClick(button: UIButton) {
        
        if button.tag == currentBtnIndex {return}
        let oldLable = titleBtnArray[currentBtnIndex]
        button.isSelected = true
        oldLable.isSelected = false
        currentBtnIndex = button.tag
        
        //以下两步是为了设置滑条的长度略小于标题的宽度
        let scrollLinePosition = button.frame.origin.x +  button.frame.width * 0.1
        scrollLine.frame.size.width = button.frame.width * 0.8
        UIView.animate(withDuration: 0.2) { 
            self.scrollLine.frame.origin.x = scrollLinePosition
        }
        //MARK: - 代理3
        delegate?.pageTitleView(self, selectedIndex: currentBtnIndex)
    }
    
    //MARK: - 公开给外部调用的函数（根据外部某些参数的改变设置title的属性）
    func setTitleWithProgress(_ progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        let sourceBtn = titleBtnArray[sourceIndex]
        let targetBtn = titleBtnArray[targetIndex]
        let moveTotalX = targetBtn.frame.origin.x - sourceBtn.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceBtn.frame.origin.x + sourceBtn.frame.width * 0.1 + moveX
        
        if progress > 0.5 {
            sourceBtn.isSelected = false
            targetBtn.isSelected = true
        }else{
            sourceBtn.isSelected = true
            targetBtn.isSelected = false
        }
        
        currentBtnIndex = targetIndex
    }
    
}


