//
//  TrainVC.swift
//  iCar
//
//  Created by mac on 2017/10/19.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class TrainVC: UIViewController {

    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreen_W, height: kScreenViewH), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "TrainTableViewCell1", bundle: nil), forCellReuseIdentifier: "TrainTableViewCell1")
        tableView.register(UINib.init(nibName: "TrainTableViewCell2", bundle: nil), forCellReuseIdentifier: "TrainTableViewCell2")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.title =  "培训"
        
        self.view.addSubview(tableView)
        
    }
}
extension TrainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%3 == 0 {
            return 250
        }else{
            return 100
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%3 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrainTableViewCell1", for: indexPath) as! TrainTableViewCell1
            cell.selectionStyle = .none
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrainTableViewCell2", for: indexPath) as! TrainTableViewCell2
            cell.selectionStyle = .none
            
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailC = TrainDetailVC()
        
        self.navigationController?.pushViewController(detailC, animated: true)
    }
}
