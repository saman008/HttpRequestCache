//
//  WebViewController.swift
//  LoveCar
//
//  Created by mac on 2017/10/17.
//  Copyright © 2017年 Mobisit. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView.init(frame: self.view.bounds)
        webView.loadRequest(URLRequest.init(url: URL.init(string: "https://www.baidu.com")!))
        self.view.addSubview(webView)
    }
}
