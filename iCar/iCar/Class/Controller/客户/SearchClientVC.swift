//
//  SearchClientVC.swift
//  iCar
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SearchClientVC: UIViewController {

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
        
        self.navigationItem.titleView = searchBar
        self.view.addSubview(tableView)
    }
}

extension SearchClientVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClientTableViewCell", for: indexPath) as! MyClientTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        
        return cell
    }
}
extension SearchClientVC: MyClientTableViewCellDelegate{
    
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
extension SearchClientVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}
