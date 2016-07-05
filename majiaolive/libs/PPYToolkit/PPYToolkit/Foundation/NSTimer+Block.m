//
//  NSTimer+Block.m
//  PPYToolkit
//
//  Created by Hale Chan on 14-9-17.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats
{
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(ppy_timerWithBlockFired:) userInfo:[action copy] repeats:repeats];
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats
{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(ppy_timerWithBlockFired:) userInfo:[action copy] repeats:repeats];
}

- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats
{
    return [self initWithFireDate:date interval:seconds target:[self class] selector:@selector(ppy_timerWithBlockFired:) userInfo:[action copy] repeats:repeats];
}

+ (void)ppy_timerWithBlockFired:(NSTimer *)timer
{
    void (^action)(NSTimer *timer) = timer.userInfo;
    if (action) {
        action(timer);
    }
}

@end
