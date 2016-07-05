//
//  PPYPerformanceProfiler.m
//  PPYToolkit
//
//  Created by Hale Chan on 12/2/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import "PPYPerformanceProfiler.h"
#import <Foundation/Foundation.h>

#include <mach/mach_time.h>
#include <time.h>
#include <math.h>

double PPYRunningCostProfile(NSString *title, void(^block)())
{
    uint64_t start = mach_absolute_time();
    
    block();
    
    uint64_t end = mach_absolute_time();
    uint64_t difference = end - start;
    
    static mach_timebase_info_data_t info = {0,0};
    if (info.denom == 0){
        mach_timebase_info(&info);
    }
    uint64_t elapsednano = difference * (info.numer / info.denom);
    double seconds = (double)elapsednano / NSEC_PER_SEC;
    NSLog(@"[Running Time Profile] %@ : %.6f s (%llu ns)", title, seconds, elapsednano);
    return seconds;
}
