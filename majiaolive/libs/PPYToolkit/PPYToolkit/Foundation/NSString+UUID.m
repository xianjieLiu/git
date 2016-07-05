//
//  NSString+UUID.m
//  PPYToolkit
//
//  Created by Hale Chan on 14/10/23.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString (UUID)
+ (NSString *)UUID
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    return uuidString;
}

+ (NSString *)UUIDWithoutGap
{
    NSString *uuid = [NSString UUID];
    NSString *result = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return [result lowercaseString];
}
@end
