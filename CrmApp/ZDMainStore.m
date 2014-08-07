//
//  ZDMainStore.m
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDMainStore.h"
#import "ZDCrmWebService.h"
#import "Customer+Save.h"
#import "JSONKit/JSONKit.h"

@implementation ZDMainStore

+ (ZDMainStore *)sharedStore
{
    static ZDMainStore* _loginStore;
    if (!_loginStore) {
        _loginStore = [[ZDMainStore alloc] init];
    }
    return _loginStore;
}

- (void)syncAllDataAfterLogin:(NSString *)managerId
{
    [[ZDCrmWebService defaultWebService] getCustomers:managerId completeHandler:^(NSString *obj, NSError *error, NSDictionary *returnJSON) {
        if (!error && [obj isEqualToString:@"0"]) {
            [self deleteAllCustomersForUserId:managerId error:NULL];
            for (NSDictionary* item in returnJSON[@"infos"]) {
                [Customer saveCustomer:item];
                if (item[@"customerId"]) {
                    // 根据客户ID去查所有products
                    
                }
            }
            
            ZDAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
            NSManagedObjectContext* context = appDelegate.crmDatabaseContext;
                NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
                request.predicate = [NSPredicate predicateWithFormat:@"userid = %@", managerId];
                
                NSError *error;
                NSArray *matches = [context executeFetchRequest:request error:&error];
            
            NSLog(@"%lu", (unsigned long)matches.count);

            
            
        }
    }];
}

- (BOOL)deleteAllCustomersForUserId:(NSUInteger)userId error:(NSError **)error
{
    ZDAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* managedObjectContext = appDelegate.crmDatabaseContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
    
    NSArray *fetchResults = [managedObjectContext executeFetchRequest:request error:error];
    if (fetchResults) {
        for (Customer *obj in fetchResults) {
            [managedObjectContext deleteObject:obj];
        }
        [managedObjectContext save:NULL];
    } else {
        return NO;
    }
    
    return YES;
}

@end
