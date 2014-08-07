//
//  ZDLoginStore.h
//  CrmApp
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDCrmWebService.h"

@class User;

@interface ZDLoginStore : NSObject

@property (nonatomic, strong) UIViewController* rootMainViewController;
@property (nonatomic, strong) UIViewController* rootLoginViewController;

+ (ZDLoginStore *)sharedStore;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completeHandler:(CompleteHandler)completeHandler;
- (BOOL)validateGestureLogin:(NSString *)string;
- (void)convertRootViewControllerWithoutAnimation;

- (User *)userWithId:(NSString *)userId;
- (BOOL)existsUser:(NSString *)userId;


@end
