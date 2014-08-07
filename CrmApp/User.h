//
//  User.h
//  CrmApp
//
//  Created by 施赛峰 on 14-7-26.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * gesturePassword;

@end
