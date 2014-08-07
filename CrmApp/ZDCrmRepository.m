//
//  ZDCrmRepository.m
//  CrmApp
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDCrmRepository.h"

@implementation ZDCrmRepository

+ (NSURL *)URLForLogin
{
    NSString* urlString = [NSString stringWithFormat:@"%@/%@", API_URL, @"manageraccount/login"];
    return [NSURL URLWithString:urlString];
}

+ (NSURL *)URLForCustomers
{
    NSString* urlString = [NSString stringWithFormat:@"%@/%@", API_URL, @"manageraccount/getCustomers"];
    return [NSURL URLWithString:urlString];
}

@end
