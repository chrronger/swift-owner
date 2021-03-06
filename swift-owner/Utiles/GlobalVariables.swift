//
//  GlobalVariables.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

 //MARK:2016.11.1 

//方法使用viewController
internal func Init<T> (_ value:T,block:(_ object:T) -> Void ) ->T {
    block(value)
    return value
}



let SCREEN_BOUNDS = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height

struct globalVariables {
    static let urlLink = URL.init(string: "http://mexonis.com/home.json")!
    static let rect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
    static let width  = UIScreen.main.bounds.width
    static let height: CGFloat =  64
}




/** 用于搜索 （text输入文本 ）  需替换URL  */
func requestSuggestionsURL(text: String) -> URL {
    let netText = text.addingPercentEncoding(withAllowedCharacters: CharacterSet())!
    let url = URL.init(string: "https://api.bing.com/osjson.aspx?query=\(netText)")!
    return url
}
/** 网络连接 */
func showNotification() {
    print("Please check your internet connection")
}


/** globalvaribales enum */
enum stateOfVC {
    case minimized
    case fullScreen
    case hidden
}

/**
 手机型号枚举
 */
enum iPhoneModel {
    
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6p
    case iPad
    
    /**
     获取当前手机型号
     
     - returns: 返回手机型号枚举
     */
    static func getCurrentModel() -> iPhoneModel {
        switch SCREEN_HEIGHT {
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6p
        default:
            return .iPad
        }
    }
}

//





/**
 给控件添加弹簧动画  需要导入 pop
 */
//func setupButtonSpringAnimation(view: UIView) {
//    let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
//    sprintAnimation.fromValue = NSValue(CGPoint: CGPoint(x: 0.8, y: 0.8))
//    sprintAnimation.toValue = NSValue(CGPoint: CGPoint(x: 1, y: 1))
//    sprintAnimation.velocity = NSValue(CGPoint: CGPoint(x: 30, y: 30))
//    sprintAnimation.springBounciness = 20
//    view.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
//}





/**
 获取缓存的json数据
 
 */






