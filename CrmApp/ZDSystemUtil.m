//
//  ZDSystemUtil.m
//  CrmApp
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDSystemUtil.h"

@implementation ZDSystemUtil


+ (NSString *)md5:(NSString *)value
{
    char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
    
    const char * cStr = [value UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); 
    
    int j = 16;
    unsigned char str[48];
    int k = 0;
    for (int i = 0; i < j; i++)
    {
        Byte byte0 = result[i];
        str[k++] = hexDigits[byte0 >> 4 & 0xf];
        str[k++] = hexDigits[byte0 & 0xf];
        str[k++] = hexDigits[byte0 & 3];
        
    }
    NSString *strNSString = [NSString stringWithFormat:@"%s",str];//[[[NSString alloc] initWithCString:str encoding:NSASCIIStringEncoding] autorelease];
    
    
    return [strNSString substringToIndex:48];
}
@end
