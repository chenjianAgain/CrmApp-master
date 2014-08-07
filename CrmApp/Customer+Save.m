//
//  Customer+Create.m
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "Customer+Save.h"

@implementation Customer (Save)

+ (BOOL)saveCustomer:(NSDictionary *)dict
{
    ZDAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.crmDatabaseContext;
    Customer* customer = [NSEntityDescription insertNewObjectForEntityForName:@"Customer"
                                  inManagedObjectContext:context];
    customer.userid = [[NSUserDefaults standardUserDefaults] stringForKey:USER_ID];
    customer.dt = dict[@"dt"];
    customer.customerName = dict[@"customerName"];
    customer.customerId = dict[@"customerId"];
    customer.customerType = dict[@"customerType"];
    customer.idNum = dict[@"idNum"];
    customer.mobile = dict[@"mobile"];
    customer.cdHope = dict[@"cdHope"];
    
    return [context save:nil];
}

@end
