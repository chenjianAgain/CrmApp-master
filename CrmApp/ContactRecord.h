//
//  ContactRecord.h
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ContactRecord : NSManagedObject

@property (nonatomic, retain) NSString * contactRecordId;
@property (nonatomic, retain) NSString * contactType;
@property (nonatomic, retain) NSString * contactNum;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * hope;
@property (nonatomic, retain) NSString * contactTime;
@property (nonatomic, retain) NSString * inputId;
@property (nonatomic, retain) NSString * memo;

@end
