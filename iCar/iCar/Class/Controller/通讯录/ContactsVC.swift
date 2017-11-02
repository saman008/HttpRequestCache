//
//  ContactsVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {

    var boolArray = [Bool]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), style: .grouped)
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsTableViewCell")
        
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: 10))
        header.backgroundColor = UIColor.groupTableViewBackground
        tableView.tableHeaderView = header
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "通讯录"
        
        
        //获取到数据后根据数据给boolArray赋初值
        for _ in 0..<5 {
            self.boolArray.append(false)
        }
        //然后再添加tabView
        self.view.addSubview(tableView)
    }
}

extension ContactsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UINib.init(nibName: "ContactsHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ContactsHeaderView
        header.delegate = self
        header.sectionNameLabel.text = "第\(section)组"
        header.showBtn.tag = section + 500
        header.showBtn.isSelected = boolArray[section]
        
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if boolArray[section]{
            return 4
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
extension ContactsVC: ContactsHeaderViewDelegate{
    func showBtnClicked(sender: UIButton) {
        self.boolArray[sender.tag - 500] = sender.isSelected
        self.tableView.reloadSections(NSIndexSet.init(index: sender.tag - 500) as IndexSet, with: .automatic)//刷新指定的组
    }
}
