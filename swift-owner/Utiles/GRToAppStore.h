//
//  GRToAppStore.h
//  swift-owner
//
//  Created by sen on 2016/9/20.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


///弹框询问评论

@interface GRToAppStore : NSObject


{
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    
    UIAlertView *alertViewTest;
    
#else
    
    UIAlertController *alertController;
    
#endif
    
    
}

@property (nonatomic,strong) NSString * myAppID;//appID


- (void)showGotoAppStore:(UIViewController *)controller;

@end
