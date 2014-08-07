//
//  ZDMainStore.h
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDMainStore : NSObject

+ (ZDMainStore *)sharedStore;

- (void)syncAllDataAfterLogin:(NSString *)managerId;

@end
