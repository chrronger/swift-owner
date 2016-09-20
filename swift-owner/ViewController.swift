//
//  ViewController.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tabview:UITableView = {
        let _tabview = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        return _tabview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.randomColor()
        
//        tabview.mj_header = setupHeaderRefresh(target: self, action: #selector())
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

