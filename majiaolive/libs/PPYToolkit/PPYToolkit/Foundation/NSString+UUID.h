//
//  NSString+UUID.h
//  PPYToolkit
//
//  Created by Hale Chan on 14/10/23.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UUID)
+ (NSString *)UUID;
+ (NSString *)UUIDWithoutGap;
@end
