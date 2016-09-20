//
//  GRRefresh.swift
//  swift-owner
//
//  Created by sen on 2016/9/20.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit
import MJRefresh

/**
 beginRefreshing
 
 快速创建上拉加载更多控件
 */
func setupFooterRefresh(target: AnyObject, action: Selector) -> MJRefreshFooter {
    let footerRefresh = MJRefreshBackNormalFooter(refreshingTarget: target, refreshingAction: action)
    footerRefresh?.isAutomaticallyHidden = true
    footerRefresh?.setTitle("正在加载", for: MJRefreshState.refreshing)
    footerRefresh?.setTitle("可以松开了", for: MJRefreshState.pulling)
    footerRefresh?.setTitle("上拉加载更多", for: MJRefreshState.idle)
    footerRefresh?.setTitle("没有啦~~~", for: MJRefreshState.noMoreData)
    return footerRefresh!
}

/**
 快速创建下拉加载最新控件
 */
func setupHeaderRefresh(target: AnyObject, action: Selector) -> MJRefreshNormalHeader {
    let headerRefresh = MJRefreshNormalHeader(refreshingTarget: target, refreshingAction: action)
    headerRefresh?.lastUpdatedTimeLabel.isHidden = true
    headerRefresh?.stateLabel.isHidden = true
    return headerRefresh!
}





