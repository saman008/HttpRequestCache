//
//  MyDistributorVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class MyDistributorVC: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), style: .grouped)
        tableView.rowHeight = 64
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "DistributorTableViewCell", bundle: nil), forCellReuseIdentifier: "DistributorTableViewCell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        self.navigationItem.title = "我的分销"
        self.view.addSubview(tableView)
        
    }
}

extension MyDistributorVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DistributorTableViewCell", for: indexPath) as! DistributorTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let performanceC = DistributorPerformanceVC()
        
        self.navigationController?.pushViewController(performanceC, animated: true)
    }
}
