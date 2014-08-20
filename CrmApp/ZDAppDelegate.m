//
//  ZDAppDelegate.m
//  CrmApp
//
//  Created by apple on 14-7-21.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDAppDelegate.h"
#import "ZDAppDelegate+MOC.h"
#import "ZDLoginStore.h"
#import "User.h"
#import "ZDCrmRepository.h"
#import <CoreData/CoreData.h>

#define CRM_FETCH @"crm fetch"

@interface ZDAppDelegate () <NSURLSessionDownloadDelegate>

@property (strong, nonatomic) NSURLSession* crmUploadSession;
@property (strong, nonatomic) NSURLSessionUploadTask *uploadTask;

@end

@implementation ZDAppDelegate

#pragma mark - Properties

- (NSManagedObjectContext *)crmDatabaseContext
{
    if (!_crmDatabaseContext) {
        self.crmDatabaseContext = [self createMainQueueManagedObjectContext];
    }
    return _crmDatabaseContext;
}

#pragma mark - UIApplicationDelegate

- (void)customizeAppearance
{
    // Set NavigationBar appearance
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar_bg"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont systemFontOfSize:20],
                                                           NSForegroundColorAttributeName: [UIColor whiteColor]
                                                           }];
    // Set StatusBar appearance
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[ZDLoginStore sharedStore] convertRootViewControllerWithoutAnimation];
    
    [self customizeAppearance];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"...applicationWillEnterForeground...");
    [[ZDLoginStore sharedStore] convertRootViewControllerWithoutAnimation];
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    
}

#pragma mark - NSURLSessionDownloadDelegate

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)localFile
{
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    // we don't support resuming an interrupted download task
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    // we don't report the progress of a download in our UI, but this is a cool method to do that with
}

@end
