//
//  StorageVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class StorageVC: UIViewController {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: -1, width: kScreen_W, height: 42))//多出的2个像素，只是为了隐藏搜索框的上下黑色线
        searchBar.placeholder = "按车辆名称搜索"
        searchBar.barTintColor = UIColor.groupTableViewBackground
        
        return searchBar
    }()
    lazy var titleView: UIView = {
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 40, width: kScreen_W, height: 40))
        titleView.backgroundColor = UIColor.white
        let leftBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W/2, height: titleView.frame.size.height))
        leftBtn.setTitle("品牌", for: .normal)
        leftBtn.setTitleColor(UIColor.black, for: .normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        titleView.addSubview(leftBtn)
        
        let rightBtn = UIButton.init(frame: CGRect.init(x: kScreen_W/2, y: 0, width: kScreen_W/2, height: titleView.frame.size.height))
        rightBtn.setTitle("城市", for: .normal)
        rightBtn.setTitleColor(UIColor.black, for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        titleView.addSubview(rightBtn)
        
        let centerLine = UIView.init(frame: CGRect.init(x: kScreen_W/2, y: 5, width: 1, height: titleView.frame.size.height - 10))
        centerLine.backgroundColor = UIColor.lightGray
        titleView.addSubview(centerLine)
        
        return titleView
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y:40+self.titleView.frame.size.height, width: kScreen_W, height: kScreenViewH - 40), style: .grouped)
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
        self.navigationItem.title =  "库存查询"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "搜索", style: .plain, target: self, action: #selector(searchAction))
        
        
        self.view.addSubview(searchBar)
        self.view.addSubview(titleView)
        self.view.addSubview(tableView)
    }
}
extension StorageVC{
    @objc func addAction(){
        let addC = AddClientVC()
        self.navigationController?.pushViewController(addC, animated: true)
    }
    @objc func searchAction(){
        let searchC = SearchStorageVC()
        self.navigationController?.pushViewController(searchC, animated: false)
    }
    
}

extension StorageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StorageTableViewCell", for: indexPath) as! StorageTableViewCell
        cell.selectionStyle = .none
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
extension StorageVC: MyClientTableViewCellDelegate{
    
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
