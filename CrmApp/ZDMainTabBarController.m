
//
//  ZDMainTabBarController.m
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDMainTabBarController.h"
#import "ZDMainStore.h"

@interface ZDMainTabBarController ()

@end

@implementation ZDMainTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[ZDMainStore sharedStore] syncAllDataAfterLogin:[[NSUserDefaults standardUserDefaults] stringForKey:USER_ID]];
}

@end
