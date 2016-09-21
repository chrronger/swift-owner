//
//  ViewController.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit
import StoreKit  //商店
import YYCache

class ViewController: UIViewController,SKStoreProductViewControllerDelegate {
    
    lazy var tabview:UITableView = {
        let _tabview = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        return _tabview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.randomColor()
        
//        tabview.mj_header = setupHeaderRefresh(target: self, action: #selector())
       
    }
    ///跳转应用商店===>应用评价
    func jumpToAppstore(){
        let store = SKStoreProductViewController()
        store.delegate = self
        store.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier : "APPLE_ID"]) { (success, error) in
            if success {
                self.present(store, animated: true, completion: nil)
            } else {
                print(error)
            }
        }
        
    }
    ///SKStoreProductViewControllerDelegate
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    ///清除缓存  cell
//    let group1CellModel1 = JFProfileCellLabelModel(title: "清除缓存", text: "\(String(format: "%.2f", CGFloat(YYImageCache.sharedCache().diskCache.totalCost()) / 1024 / 1024))M")
//         group1CellModel1.operation = { () -> Void in
//              JFProgressHUD.showWithStatus("正在清理")
//              SDImageCache.sharedImageCache().cleanDisk()
//          YYImageCache.sharedCache().memoryCache.removeAllObjects()
//            YYImageCache.sharedCache().diskCache.removeAllObjectsWithBlock({
//            JFProgressHUD.showSuccessWithStatus("清理成功")
//            group1CellModel1.text = "0.00M"
//            dispatch_async(dispatch_get_main_queue(), {
//          self.tableView.reloadData()
//        })
//     })
//    }
    
   
    ///头像
    
    
    
    
    
}

