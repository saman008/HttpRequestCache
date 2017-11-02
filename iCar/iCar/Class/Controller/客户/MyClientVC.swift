//
//  MyClientVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class MyClientVC: UIViewController {

    lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: -1, width: kScreen_W, height: 42))//多出的2个像素，只是为了隐藏搜索框的上下黑色线
        searchBar.placeholder = "客户姓名/电话号码"
        searchBar.barTintColor = UIColor.groupTableViewBackground
        
        return searchBar
    }()
    lazy var titleView: UIView = {
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 40, width: kScreen_W, height: 40))
        titleView.backgroundColor = UIColor.white
        let leftBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W/2, height: titleView.frame.size.height))
        leftBtn.setTitle("意向", for: .normal)
        leftBtn.setTitleColor(UIColor.black, for: .normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        titleView.addSubview(leftBtn)
        
        let rightBtn = UIButton.init(frame: CGRect.init(x: kScreen_W/2, y: 0, width: kScreen_W/2, height: titleView.frame.size.height))
        rightBtn.setTitle("时间", for: .normal)
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
        tableView.rowHeight = 255
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "MyClientTableViewCell", bundle: nil), forCellReuseIdentifier: "MyClientTableViewCell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.title =  "客户"
        let item1 = UIBarButtonItem.init(image: UIImage.init(named: "三者险")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(addAction))
        let item2 = UIBarButtonItem.init(image: UIImage.init(named: "三者险")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchAction))
        self.navigationItem.rightBarButtonItems = [item1, item2]
        
        self.view.addSubview(searchBar)
        self.view.addSubview(titleView)
        self.view.addSubview(tableView)
    }
}
extension MyClientVC{
    @objc func addAction(){
        let addC = AddClientVC()
        self.navigationController?.pushViewController(addC, animated: true)
    }
    @objc func searchAction(){
        let searchC = SearchClientVC()
        self.navigationController?.pushViewController(searchC, animated: true)
    }
}

extension MyClientVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClientTableViewCell", for: indexPath) as! MyClientTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
extension MyClientVC: MyClientTableViewCellDelegate{
    
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
