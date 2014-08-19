//
//  ZDGesturePasswordSettingViewController.h
//  CRMManager
//
//  Created by peter on 14-8-12.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDSettingViewController.h"

@protocol ZDGesturePasswordSettingViewControllerDelegate;

@interface ZDGesturePasswordSettingViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) id<ZDGesturePasswordSettingViewControllerDelegate> delegate;

@end

@protocol ZDGesturePasswordSettingViewControllerDelegate <NSObject>

@optional

- (void)gesturePasswordSettingViewControllerDidFinishSettingGesture:(ZDGesturePasswordSettingViewController *)controller;

@end
