//
//  GRStoreInfo.h
//  swift-owner
//
//  Created by sen on 2016/9/20.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <Foundation/Foundation.h>

//下载东西的时候，先获取硬盘信息。

@interface GRStoreInfo : NSObject

/**
 *  获取硬盘总容量
 *
 *  @return 容量字符串
 */
+ (NSString *)getTotalDiskSize;

/**
 *  获取硬盘已经占用的
 *
 *  @return 容量字符串
 */
+ (NSString *)getOccupyDiskSize;

/**
 *  获取硬盘可以容量
 *
 *  @return 容量字符串
 */
+ (NSString *)getAvailableDiskSize;

/**
 *  计算文件夹下文件的总大小
 *
 *  @param folderPath 目录路径
 *
 *  @return 返回大小
 */
+ (float )folderSizeAtPath:(NSString*)folderPath;

@end
