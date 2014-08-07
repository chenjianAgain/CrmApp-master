//
//  Customer.h
//  CrmApp
//
//  Created by apple on 14-8-4.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Customer : NSManagedObject

@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSString * customerId;
@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * idNum;
@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) NSString * cdHope;
@property (nonatomic, retain) NSString * dt;
@property (nonatomic, retain) NSString * customerType;
@property (nonatomic, retain) NSString * contactRecordId;

@end
