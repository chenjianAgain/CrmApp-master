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
    // Create resizable images
    UIImage *gradientImage44 =
    [[UIImage imageNamed:@"surf_gradient_textured_64"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *gradientImage32 =
    [[UIImage imageNamed:@"surf_gradient_textured_32"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    // Set the background image for *all* UINavigationBars
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:gradientImage32
                                       forBarMetrics:UIBarMetricsLandscapePhone];
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0
                       blue:255.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Arial-Bold" size:0.0],
      UITextAttributeFont,
      nil]];
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
