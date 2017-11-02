//
//  SearchStorageVC.swift
//  iCar
//
//  Created by mac on 2017/10/25.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class SearchStorageVC: UIViewController {

    var historyArray = ["奥迪A5", "奔驰", "宝马 2.0T", "大众 1.5T" ,"五菱宏光"]
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: 44))
        searchBar.delegate = self
        searchBar.placeholder = "客户姓名/手机号"
        searchBar.barStyle = .blackOpaque
        
        return searchBar
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 64
        tableView.register(UINib.init(nibName: "StorageTableViewCell", bundle: nil), forCellReuseIdentifier: "StorageTableViewCell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        self.navigationItem.titleView = searchBar
        self.view.addSubview(tableView)
    }
}
extension SearchStorageVC{
    @objc func deleteBtnAction(sender: UIButton){
        let index = sender.tag - 600
        historyArray.remove(at: index)
        addHistoryView()
    }
    @objc func deleteAllBtnAction(){
        historyArray.removeAll()
        addHistoryView()
    }
    func addHistoryView(){
        //如果有历史视图了就删除
        self.view.viewWithTag(500)?.removeFromSuperview()
        //确认没有后再进行添加
        let historyView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH))
        historyView.backgroundColor = UIColor.groupTableViewBackground
        historyView.tag = 500
        
        let H: CGFloat = 40
        for (i, item) in historyArray.enumerated() {
            let bgView = UIView.init(frame: CGRect.init(x: 0, y: CGFloat(i)*H, width: kScreen_W, height: H))
            bgView.backgroundColor = UIColor.white
            
            let img = UIImageView.init(frame: CGRect.init(x: kMargin, y: 0, width: 15, height: 15))
            img.center.y = bgView.frame.size.height/2
            img.image = UIImage.init(named: "微博")
            bgView.addSubview(img)
            
            let label = UILabel.init(frame: CGRect.init(x: 35, y: 0, width: kScreen_W - 60, height: bgView.frame.size.height))
            label.text = item
            label.font = UIFont.systemFont(ofSize: 15)
            bgView.addSubview(label)
            
            let deleteBtn = UIButton.init(frame: CGRect.init(x: kScreen_W - 30, y: 0, width: 30, height: H))
            deleteBtn.setImage(UIImage.init(named: "微博"), for: .normal)
            deleteBtn.tag = 600+i
            deleteBtn.addTarget(self, action: #selector(deleteBtnAction(sender:)), for: .touchUpInside)
            bgView.addSubview(deleteBtn)
            
            let line = UIView.init(frame: CGRect.init(x: 0, y: 39, width: kScreen_W, height: 1))
            line.backgroundColor = UIColor.groupTableViewBackground
            bgView.addSubview(line)
            
            historyView.addSubview(bgView)
        }
        
        if historyArray.count > 0 {
            //添加清空搜索按钮
            let deleteAllBtn = UIButton.init(frame: CGRect.init(x: 0, y: CGFloat(historyArray.count)*H, width: kScreen_W, height: 49))
            deleteAllBtn.backgroundColor = UIColor.white
            deleteAllBtn.setTitle("清空搜索记录", for: .normal)
            deleteAllBtn.setTitleColor(UIColor.lightGray, for: .normal)
            deleteAllBtn.addTarget(self, action: #selector(deleteAllBtnAction), for: .touchUpInside)
            historyView.addSubview(deleteAllBtn)
        }
        
        self.view.addSubview(historyView)
    }
}
extension SearchStorageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StorageTableViewCell", for: indexPath) as! StorageTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
}
extension SearchStorageVC: MyClientTableViewCellDelegate{
    
    func callBtnClicked() {
        UIAlertController.addPhoneAlertController(target: self, phoneNumber: "10086")
    }
    
    func followBtnClicked() {
        let followC = AddFollowVC()
        self.navigationController?.pushViewController(followC, animated: true)
    }
    
    func taskBtnClicked() {
        let taskC = AddTaskVC()
        self.navigationController?.pushViewController(taskC, animated: true)
    }
}
extension SearchStorageVC: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {//搜索框开始编辑的时候
        addHistoryView()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {//放弃第一响应者会调用的代理
        self.view.viewWithTag(500)?.removeFromSuperview()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        if searchBar.text != "" {
            self.historyArray.insert(searchBar.text!, at: 0)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
}
