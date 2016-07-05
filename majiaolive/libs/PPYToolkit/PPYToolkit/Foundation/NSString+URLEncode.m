//
//  NSString+URLEncode.m
//  SuperCal
//
//  Created by Hale Chan on 14/10/23.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)stringByApplyURLEncode
{
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@";/?:@&=$+{}<>,!*'\"()/#[]% ",
                                                               kCFStringEncodingUTF8);
    return result;
}

- (NSString *)stringByApplyURLDecode
{
    return  [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
