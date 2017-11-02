//
//  DistributorPerformanceVC.swift
//  iCar
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class DistributorPerformanceVC: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: -kNavigationBarH, width: kScreen_W, height: kScreen_H + kNavigationBarH), style: .grouped)
        tableView.rowHeight = 64
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "SalesTableViewCell", bundle: nil), forCellReuseIdentifier: "SalesTableViewCell")
        let header = UINib.init(nibName: "DistributorHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! DistributorHeaderView
        header.delegate = self
        header.frame.size.height = kNavigationBarH + 175 + 64
        tableView.tableHeaderView = header
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        self.navigationItem.title = "分销业绩"
        self.view.addSubview(tableView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
    }
    
}

extension DistributorPerformanceVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesTableViewCell", for: indexPath) as! SalesTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailC = SalesDetailVC()
        
        self.navigationController?.pushViewController(detailC, animated: true)
    }
}
extension DistributorPerformanceVC: DistributorHeaderViewDelegate{
    func saleBtnClicked() {
        let detailC = SalesDetailVC()
        detailC.navigationItem.title = "分销详情"
        self.navigationController?.pushViewController(detailC, animated: true)
    }
    
    func royaltiesBtnClicked() {
        let royC = RoyaltiesVC()
        royC.navigationItem.title = "分销返利"
        self.navigationController?.pushViewController(royC, animated: true)
    }
}
