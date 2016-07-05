//
//  PPYFoundationToolkit.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/2/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSDate+Day.h"
#import "NSString+UUID.h"
#import "NSString+PPYToolkit.h"
#import "NSTimer+Block.h"
#import "NSDictionary+DefaultValue.h"
#import "NSData+JSON.h"
#import "NSData+PPYToolkit.h"
#import "PPYPerformanceProfiler.h"

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ELog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
