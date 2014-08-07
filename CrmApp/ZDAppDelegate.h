//
//  ZDAppDelegate.h
//  CrmApp
//
//  Created by apple on 14-7-21.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectContext *crmDatabaseContext;



@end
