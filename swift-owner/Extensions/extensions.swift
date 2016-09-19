//
//  extensions.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit


extension UIColor{
    /** rgb */
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return color
    }
    
    /**
     16进制转UIColor
     */
    class func colorWithHexString(hex:String) -> UIColor {
       
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
     /** 随机颜色 */
    class func randomColor()->UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(255))/255, green:CGFloat(arc4random_uniform(255))/255 , blue: CGFloat(arc4random_uniform(255))/255, alpha: 1)
    }

}

extension String{
    /**
     时间戳转为时间
     
     - returns: 时间字符串
     */
    func timeStampToString() -> String {
        let string = NSString(string: self)
        let timeSta: TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
    }
    
    /**
     时间戳转为NSDate
     
     - returns: NSDate
     */
    func timeStampToDate() -> NSDate {
        let string = NSString(string: self)
        let timeSta: TimeInterval = string.doubleValue
        let date = NSDate(timeIntervalSince1970: timeSta)
        return date
    }
    
    /**
     时间转为时间戳
     
     - returns: 时间戳字符串
     */
    func stringToTimeStamp() -> String {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dfmatter.date(from: self)
        let dateStamp: TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
    /** 时间 */
    func secondsToHoursMinutesSeconds (seconds : Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let second = (seconds % 3600) % 60
        let hoursString: String = {
            let hs = String(hours)
            return hs
        }()
        
        let minutesString: String = {
            var ms = ""
            if  (minutes <= 9 && minutes >= 0) {
                ms = "0\(minutes)"
            } else{
                ms = String(minutes)
            }
            return ms
        }()
        
        let secondsString: String = {
            var ss = ""
            if  (second <= 9 && second >= 0) {
                ss = "0\(second)"
            } else{
                ss = String(second)
            }
            return ss
        }()
        
        var labelStr = ""
        if hours == 0 {
            labelStr =  minutesString + ":" + secondsString
        } else{
            labelStr = hoursString + ":" + minutesString + ":" + secondsString
        }
        return labelStr
    }
}

extension NSDate {
        
    /**
     格式化NSDate为字符串
     */
    func dateToDescription() -> String {
        // ios比较日期使用 NSCalendar
        let calendar = NSCalendar.current
        
        // 判断是否是今天
        if calendar.isDateInToday(self as Date) {
            // 获取系统当前日期和self比较,相差多少秒
            let delta = Int(NSDate().timeIntervalSince(self as Date))
            
            // 判断是否是一分钟内
            if delta < 60 {
                return "刚刚"
            } else if delta < 60 * 60 {
                // 一小时内
                return "\(delta / 60) 分钟前"
            } else {
                return "\(delta / 60 / 60) 小时前"
            }
        }
        
        var fmt = ""
        
        if calendar.isDateInYesterday(self as Date) {
            // 昨天 HH:mm
            fmt = "昨天 HH:mm"
        } else {
            // 判断是一年内,还是更早期
            // 比较时间
            // date1: 比较的时间1
            // toDate: 比较的时间2
            // toUnitGranularity: 比较的单位
            //                calendar.compareDate(self, toDate: NSDate(), toUnitGranularity: NSCalendar.Unit.Year)
            
            let result = calendar.compare(self as Date, to: NSDate() as Date, toGranularity: .year)
            
            // 表示同一年
            if result == ComparisonResult.orderedSame {
                // 一年内
                // MM-dd HH:mm(一年内)
                fmt = "MM-dd HH:mm"
            } else {
                // 一年外
                fmt = "yyyy-MM-dd HH:mm"
            }
        }
        
        // 让系统的NSDate根据指定的格式转成字符串
        let df = DateFormatter()
        
        // 指定格式
        df.dateFormat = fmt
        df.locale = NSLocale(localeIdentifier: "cn") as Locale!
        
        // 将系统时间转成指定格式的字符串
        let dateStirng = df.string(from: self as Date)
        return dateStirng
    }
}

extension UIBarButtonItem {
    
    /**
     创建只带文字的item
     
     - parameter title:  标题
     - parameter target: 监听方法对象
     - parameter action: 方法选择器
     
     - returns: barButtonItem
     */
    class func leftItem(title: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let itemButton = UIButton(type: .custom)
        itemButton.size = CGSize(width: 50, height: 44)
        itemButton.contentHorizontalAlignment = .left
        itemButton.setTitle(title, for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        itemButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: itemButton)
    }
    
    /**
     创建只带文字的item
     
     - parameter title:  标题
     - parameter target: 监听方法对象
     - parameter action: 方法选择器
     
     - returns: barButtonItem
     */
    class func rightItem(title: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let itemButton = UIButton(type: .custom)
        itemButton.size = CGSize(width: 50, height: 44)
        itemButton.contentHorizontalAlignment = .right
        itemButton.setTitle(title, for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        itemButton.setTitleColor(UIColor.white, for: .normal)
        itemButton.setTitleColor(UIColor(white: 0.9, alpha: 1), for: .disabled)
        itemButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: itemButton)
    }
    
    /**
     快速创建一个图标barButtonItem 左边
     
     - parameter normalImage:      默认图片名
     - parameter highlightedImage: 高亮图片名
     - parameter target:           监听方法对象
     - parameter action:           方法选择器
     
     - returns: barButtonItem
     */
    class func leftItem(normalImage: String, highlightedImage: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let itemButton = UIButton(type: .custom)
        itemButton.size = CGSize(width: 50, height: 44)
        itemButton.contentHorizontalAlignment = .left
        itemButton.setImage(UIImage(named: normalImage), for: .normal)
        itemButton.setImage(UIImage(named: highlightedImage), for: .highlighted)
        itemButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: itemButton)
    }
    
    /**
     快速创建一个图标barButtonItem 右边
     
     - parameter normalImage:      默认图片名
     - parameter highlightedImage: 高亮图片名
     - parameter target:           监听方法对象
     - parameter action:           方法选择器
     
     - returns: barButtonItem
     */
    class func rightItem(normalImage: String, highlightedImage: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let itemButton = UIButton(type: .custom)
        itemButton.size = CGSize(width: 50, height: 44)
        itemButton.contentHorizontalAlignment = .right
        itemButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        itemButton.setImage(UIImage(named: normalImage), for: .normal)
        itemButton.setImage(UIImage(named: highlightedImage), for: .highlighted)
        itemButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: itemButton)
    }
    
    /**
     快速创建一个带标题的barButtonItem 左边
     
     - parameter title:            标题
     - parameter normalImage:      默认图片名
     - parameter highlightedImage: 高亮图片名
     - parameter target:           监听方法对象
     - parameter action:           方法选择器
     
     - returns: barButtonItem
     */
    class func item(title: String, normalImage: String, highlightedImage: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let itemButton = UIButton(type: .custom)
        itemButton.setTitle("返回", for: .normal)
        itemButton.size = CGSize(width: 50, height: 44)
//        itemButton.setTitleColor(COLOR_NAV_ITEM_NORMAL, forState: .Normal)
//        itemButton.setTitleColor(COLOR_NAV_ITEM_HIGH, forState: .Highlighted)
        itemButton.contentHorizontalAlignment = .left
        itemButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        itemButton.setImage(UIImage(named: normalImage), for: .normal)
        itemButton.setImage(UIImage(named: highlightedImage), for: .highlighted)
        itemButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: itemButton)
    }
}



