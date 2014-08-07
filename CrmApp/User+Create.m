//
//  User+Create.m
//  CrmApp
//
//  Created by apple on 14-7-28.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "User+Create.h"
#import "ZDAppDelegate.h"

@implementation User (Create)

+ (User *)userWithId:(NSString *)userId
{
    User *user = nil;
    ZDAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.crmDatabaseContext;
    if ([userId length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        request.predicate = [NSPredicate predicateWithFormat:@"userid = %@", userId];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                         inManagedObjectContext:context];
            user.userid = userId;
        } else {
            user = [matches lastObject];
        }
    }
    
    return user;
}

+ (BOOL)existsUser:(NSString *)userId
{
    ZDAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.crmDatabaseContext;
    if ([userId length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        request.predicate = [NSPredicate predicateWithFormat:@"userid = %@", userId];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            
        } else {
            return true;
        }
    }
    return false;
}

@end
