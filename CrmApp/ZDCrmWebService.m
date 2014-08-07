//
//  ZDCrmWebService.m
//  CrmApp
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDCrmWebService.h"
#import "ZDCrmRepository.h"
#import "JSONKit.h"
#import "ZDSystemUtil.h"

@implementation ZDCrmWebService

static ZDCrmWebService* _defaultWebService = nil;
+ (ZDCrmWebService *)defaultWebService
{
    if (!_defaultWebService) _defaultWebService = [[self alloc] init];
    return _defaultWebService;
}

- (void)getCustomers:(NSString *)managerId completeHandler:(CompleteHandler)completeHandler
{
    NSDictionary* dict = @{@"pageNo":@"1", @"pageSize":@"100", @"id": managerId};
    NSURL *url = [ZDCrmRepository URLForCustomers];
    
    [self doNetworkAccess:url withData:dict completeHandler:completeHandler];
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completeHandler:(CompleteHandler)completeHandler
{
    NSString* md5Pass = [ZDSystemUtil md5:password];
    NSDictionary* dict = @{@"userName": username, @"password": md5Pass};
    NSURL *url = [ZDCrmRepository URLForLogin];
    
    [self doNetworkAccess:url withData:dict completeHandler:completeHandler];

}

- (void)doNetworkAccess:(NSURL *)url withData:(NSDictionary *)dict completeHandler:(CompleteHandler)completeHandler
{
    NSMutableData *postBody = [NSMutableData data];
    [postBody appendData:[[NSString stringWithFormat:@"json=%@", [dict JSONString]] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"" forHTTPHeaderField:@"netmac"];
    [request addValue:@"" forHTTPHeaderField:@"version"];
    [request addValue:@"" forHTTPHeaderField:@"token"];
    [request setHTTPBody:postBody];
    
    NSOperationQueue* queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!connectionError) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            if (httpResp.statusCode == 200) {
                NSError *jsonError;
                
                // 2
                NSDictionary *loginJSON =
                [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&jsonError];
                NSLog(@"%@", loginJSON);
                NSString* status =  loginJSON[@"status"];
                completeHandler(status, nil, loginJSON);
                return ;
            }
        } else {
            NSLog(@"%@", connectionError.description);
            completeHandler(@"-1", connectionError, nil);
        }
        
    }];
    
}


@end
