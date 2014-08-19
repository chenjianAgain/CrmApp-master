//
//  ZDLoginStore.m
//  CrmApp
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDLoginStore.h"
#import "ZDAppDelegate.h"
#import "User.h"
#import "ZDCrmWebService.h"
#import <CoreData/CoreData.h>
#import "ZDSystemUtil.h"
#import "User+Create.h"
#import "ZDGesturePasswordValidateViewController.h"

@interface ZDLoginStore ()

@property (nonatomic, strong) UIStoryboard* storyboard;
@property (nonatomic, strong) ZDAppDelegate* appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *crmDatabaseContext;

@property (nonatomic) BOOL isUserInterfaceIdiomPhone;

@end

@implementation ZDLoginStore

+ (ZDLoginStore *) sharedStore
{
    static ZDLoginStore* _loginStore;
    if (!_loginStore) {
        _loginStore = [[ZDLoginStore alloc] init];
    }
    return _loginStore;
}

#pragma mark - Save in Core Data

- (User *)userWithId:(NSString *)userId
{
    return [User userWithId:userId];
}

- (BOOL)existsUser:(NSString *)userId
{
    return [User existsUser:userId];
}

#pragma mark - Validations

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completeHandler:(CompleteHandler)completeHandler
{
    if (!username || !password) return;
    [[ZDCrmWebService defaultWebService] loginWithUsername:username password:password completeHandler:completeHandler];
}

- (BOOL)validateGestureLogin:(NSString *)string
{
    return YES;
}


#pragma mark - Properties

- (NSManagedObjectContext *)crmDatabaseContext
{
    return self.appDelegate.crmDatabaseContext;
}

- (BOOL)isUserInterfaceIdiomPhone
{
   return [UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad;
}

- (BOOL)hasTokenInUserDefaults
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:USER_ID] != nil;
}

- (UIStoryboard *)storyboard
{
    return [UIStoryboard storyboardWithName:self.isUserInterfaceIdiomPhone ? iPhone_STORYBOARD : iPad_STORYBOARD bundle:nil];
}

- (UIViewController *)rootMainViewController
{
    return [self.storyboard instantiateViewControllerWithIdentifier:MAIN_TAB_VIEWCONTROLLER];
}

- (UIViewController *)rootLoginViewController
{
    NSString* viewControllerName = self.hasTokenInUserDefaults ? GESTURE_LOGIN_VIEWCONTROLLER : FIRST_LOGIN_VIEWCONTROLLER ;
    
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:viewControllerName];
    
    if ([vc isKindOfClass:[ZDGesturePasswordValidateViewController class]]) {
        ZDGesturePasswordValidateViewController* gestureViewController = (ZDGesturePasswordValidateViewController *)vc;
        gestureViewController.gestureViewState = SSFPasswordGestureViewStateCheck;
        vc = gestureViewController;
    }
    
    return vc;
}

- (ZDAppDelegate *)appDelegate
{
    UIApplication* app = [UIApplication sharedApplication];
    return (ZDAppDelegate *)app.delegate;
}

#pragma mark - RootViewController Convertion

- (void)convertRootViewControllerWithoutAnimation
{
    self.appDelegate.window.rootViewController = self.rootLoginViewController;
}

@end
