//
//  ZDCrmWebService.h
//  CrmApp
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDCrmWebService : NSObject

typedef void (^CompleteHandler)(NSString *, NSError *, NSDictionary *);

+ (ZDCrmWebService *)defaultWebService;
- (void)loginWithUsername:(NSString *)username password:(NSString *)password completeHandler:(CompleteHandler)completeHandler;
- (void)getCustomers:(NSString *)managerId completeHandler:(CompleteHandler)completeHandler;
@end
