//
//  RoyaltiesVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit
import JBChartView

class RoyaltiesVC: UIViewController {

//    lazy var chartView: JBChartView = {
//
//    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: kMargin, y: 0, width: kScreen_W - 2*kMargin, height: kScreenViewH), style: .grouped)
        tableView.rowHeight = 64
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "RoyaltiesTableViewCell", bundle: nil), forCellReuseIdentifier: "RoyaltiesTableViewCell")
        
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: 320))
        let chartView = JBChartView.init(frame: CGRect.init(x: 0, y: kMargin, width: tableView.frame.size.width, height: 300))
        chartView.backgroundColor = UIColor.white
        header.addSubview(chartView)
        tableView.tableHeaderView = header
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        self.view.addSubview(tableView)
        
    }
}

extension RoyaltiesVC: UITableViewDelegate, UITableViewDataSource{
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
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoyaltiesTableViewCell", for: indexPath) as! RoyaltiesTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
