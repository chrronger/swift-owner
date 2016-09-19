//
//  GlobalVariables.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

let SCREEN_BOUNDS = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height

struct globalVariables {
    static let urlLink = URL.init(string: "http://mexonis.com/home.json")!
    static let rect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
    static let width  = UIScreen.main.bounds.width
    static let height: CGFloat =  64
}

