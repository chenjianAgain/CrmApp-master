//
//  ZDFirstLoginViewController.m
//  CrmApp
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDLoginViewController.h"
#import "ZDLoginStore.h"
#import "ZDGesturePasswordValidateViewController.h"
#import "ZDGesturePasswordSettingViewController.h"

@interface ZDLoginViewController () <ZDGesturePasswordSettingViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextField* usernameLabel;
@property (nonatomic, weak) IBOutlet UITextField* passwordLabel;


- (IBAction)loginButtonPressed:(id)sender;

@end

@implementation ZDLoginViewController

- (void)gesturePasswordSettingViewControllerDidFinishSettingGesture:(ZDGesturePasswordSettingViewController *)controller
{
    [self.presentedViewController dismissViewControllerAnimated:NO completion:nil];
    self.view.window.rootViewController = [ZDLoginStore sharedStore].rootMainViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.usernameLabel.text = @"crm";
    self.passwordLabel.text = @"wozhengdebuzhidao";
}

- (UIViewController *)viewControllerToPresent:(NSString *)result
{
    UIViewController* toPresent = nil;
    BOOL hasBeenLogged = [[ZDLoginStore sharedStore] existsUser:result];
    if (!hasBeenLogged) {
        [[ZDLoginStore sharedStore] userWithId:result];
        
        ZDGesturePasswordSettingViewController *gestureViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"ZDGesturePasswordSettingViewController"];
        gestureViewController.delegate = self;
        toPresent = gestureViewController;
    } else {
        ZDGesturePasswordValidateViewController *gestureViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"ZDGesturePasswordValidateViewController"];
        gestureViewController.gestureViewState = SSFPasswordGestureViewStateCheck;
        toPresent = gestureViewController;
    }
    return toPresent;
}

- (void)loginButtonPressed:(id)sender
{
    [[ZDLoginStore sharedStore] loginWithUsername:self.usernameLabel.text password:self.passwordLabel.text completeHandler:^(NSString* obj, NSError* error, NSDictionary* returnJSON){
        if (!error && [obj isEqualToString:@"0"]) {
            NSString* result = returnJSON[@"id"];
            [[NSUserDefaults standardUserDefaults] setObject:result forKey:USER_ID];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self presentViewController:[self viewControllerToPresent:result] animated:YES completion:^{
            }];
        }
    }];
}

@end
