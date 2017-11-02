//
//  NoticeVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 112
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "NoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticeTableViewCell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.title =  "公告"
        
        self.view.addSubview(tableView)
    }
}

extension NoticeVC: UITableViewDelegate, UITableViewDataSource{
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
        cell.selectionStyle = .none
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailC = NoticeDetailVC()
        
        self.navigationController?.pushViewController(detailC, animated: true)
    }
}
