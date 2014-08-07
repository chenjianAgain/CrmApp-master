//
//  ZDGestureLoginViewController.m
//  CrmApp
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDGestureLoginViewController.h"
#import "ZDLoginStore.h"
#import "SSFPasswordGestureView.h"
#import "ZDAppDelegate.h"
#import "User.h"
#import "ZDFirstLoginViewController.h"

@interface ZDGestureLoginViewController () <SSFPasswordGestureViewDelegate>

- (IBAction)swipeRight:(id)sender;

@end

@implementation ZDGestureLoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SSFPasswordGestureView* gestureView = [SSFPasswordGestureView instancePasswordView];
    gestureView.delegate = self;
    gestureView.state = self.gestureViewState;
    gestureView.center = self.view.center;
    gestureView.gesturePassword = [[NSUserDefaults standardUserDefaults] objectForKey:SSFSecondUserGesturePasswordKey];
    [self.view addSubview:gestureView];
}


- (IBAction)swipeRight:(id)sender {

    if ([[ZDLoginStore sharedStore] validateGestureLogin:@""]) {
        
    }
}

#pragma mark - SSFPasswordGestureViewDelegate

- (void)passwordGestureViewFinishFirstTimePassword:(SSFPasswordGestureView *)passwordView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请再次输入手势密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (void)passwordGestureViewFinishSecondTimePassword:(SSFPasswordGestureView *)passwordView
{
    if (![self.presentingViewController isKindOfClass:[ZDFirstLoginViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        UIViewController *mainTabViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabViewController"];
        [self presentViewController:mainTabViewController animated:YES completion:^{
            
            ZDAppDelegate *appDelegagte = [UIApplication sharedApplication].delegate;
            NSManagedObjectContext* moc = appDelegagte.crmDatabaseContext;
            
            User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc];
            user.gesturePassword = passwordView.gesturePassword;
            
            [moc save:nil];
            
        }];
    }
}

- (void)passwordGestureViewFinishWrongPassword:(SSFPasswordGestureView *)passwordView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"两次手势密码不一致，请重新输入第二次手势密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (void)passwordGestureViewFinishCheckPassword:(SSFPasswordGestureView *)passwordView
{
    UIViewController *mainTabViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabViewController"];
    [self presentViewController:mainTabViewController animated:YES completion:^{
        
        ZDAppDelegate *appDelegagte = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext* moc = appDelegagte.crmDatabaseContext;
        
        User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc];
        user.gesturePassword = passwordView.gesturePassword;
        
        [moc save:nil];
        
    }];
}

- (void)passwordGestureViewCheckPasswordWrong:(SSFPasswordGestureView *)passwordView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"手势密码验证错误，请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
