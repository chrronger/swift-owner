


//
//  GRNetworkTool.swift
//  swift-owner
//
//  Created by sen on 2016/9/20.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit
import Alamofire


///@escaping  swift3.0 闭包中不销毁。 闭包内可以不使用self，默认是non-escaping
/// 网络请求回调  data需要解析后返回======
typealias NetworkFinished = (_ success: Bool, _ result: NSData?, _ error: NSError?) -> ()

class GRNetworkTool: NSObject {

    /// 网络工具类单例
    static let shareNetworkTool = GRNetworkTool()
    
    
}

// MARK: - 基础请求方法
extension GRNetworkTool {
    
   
    /**
     GET请求
     
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func get(APIString: String, parameters: [String : AnyObject]?, finished: @escaping NetworkFinished) {
       
        print("\(BASE_URL)\(APIString)")
//        Alamofire.request(.GET, "\(BASE_URL)\(APIString)", parameters: parameters).responseJSON { (response) -> Void in
        
         Alamofire.request("\(BASE_URL)\(APIString)", method: .get, parameters: parameters).responseJSON { (response) -> Void in
            if let data = response.data {
//                let json = JSON(data: data)
                // print(json)
                finished(true, data as NSData?, nil)
            } else {
                GRProgressHUD.showInfoWithStatus(status: "您的网络不给力哦")
                finished(false, nil, response.result.error as NSError?)
            }
        }
        
    }
    
    /**
     POST请求
     
     - parameter APIString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func post(APIString: String, parameters: [String : AnyObject]?, finished: @escaping NetworkFinished) {
        
        print("\(BASE_URL)\(APIString)")
        Alamofire.request("\(BASE_URL)\(APIString)",method:.post , parameters: parameters).responseJSON { (response) -> Void in
            
            if let data = response.data {
//                let json = JSON(data: data)
                // print(json)
                finished(true, data as NSData?, nil)
            } else {
                GRProgressHUD.showInfoWithStatus(status: "您的网络不给力哦")
                finished(false, nil, response.result.error as NSError?)
            }
        }
    }
}
