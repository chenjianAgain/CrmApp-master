//
//  User+Create.h
//  CrmApp
//
//  Created by apple on 14-7-28.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "User.h"

@interface User (Create)

+ (User *)userWithId:(NSString *)userId;
+ (BOOL)existsUser:(NSString *)userId;

@end
