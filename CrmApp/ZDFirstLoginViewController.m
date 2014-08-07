//
//  ZDFirstLoginViewController.m
//  CrmApp
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDFirstLoginViewController.h"
#import "ZDLoginStore.h"
#import "ZDGestureLoginViewController.h"

@interface ZDFirstLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField* usernameLabel;
@property (nonatomic, weak) IBOutlet UITextField* passwordLabel;

- (IBAction)loginButtonPressed:(id)sender;

@end

@implementation ZDFirstLoginViewController

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
        
        ZDGestureLoginViewController *gestureViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"GestureLoginViewController"];
        gestureViewController.gestureViewState = SSFPasswordGestureViewStateWillFirstDraw;
        toPresent = gestureViewController;
    } else {
//        toPresent = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabViewController"];
        ZDGestureLoginViewController *gestureViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"GestureLoginViewController"];
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
// chenjian's test
// chenjian's test3

@end
