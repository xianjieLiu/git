//
//  NSString+SQL.m
//  SuperCal
//
//  Created by Hale Chan on 14/11/3.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "NSString+SQL.h"

@implementation NSString (SQL)
- (NSString *)stringByByAddingSlashEscape
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
    result = [result stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    result = [result stringByReplacingOccurrencesOfString:@"[" withString:@"/["];
    result = [result stringByReplacingOccurrencesOfString:@"]" withString:@"/]"];
    result = [result stringByReplacingOccurrencesOfString:@"%" withString:@"/%"];
    result = [result stringByReplacingOccurrencesOfString:@"&" withString:@"/&"];
    result = [result stringByReplacingOccurrencesOfString:@"_" withString:@"/_"];
    result = [result stringByReplacingOccurrencesOfString:@"(" withString:@"/("];
    result = [result stringByReplacingOccurrencesOfString:@")" withString:@"/)"];
    return result;
}
@end
