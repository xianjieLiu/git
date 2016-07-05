//
//  NSTimer+Block.h
//  PPYToolkit
//
//  Created by Hale Chan on 14-9-17.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  This category add some methods for the NSTimer class that supports invoking a block upon a timer firing.
 */
@interface NSTimer (Block)

/**
 *  Creates and returns a new NSTimer object initialized with the specified action.
 *
 *  You must add the new timer to a run loop, using addTimer:forMode:. Then, after seconds seconds have elapsed, the timer fires, and invokes the action block. (If the timer is configured to repeat, there is no need to subsequently re-add the timer to the run loop.)
 *
 *  @param seconds  The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 *  @param action   A block that will be invoked after the timer fires.
 *  @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 *
 *  @return A new NSTimer object, configured according to the specified parameters.
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats;

/**
 *  Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
 *  
 *  After seconds seconds have elapsed, the timer fires, and invokes the action block.
 *
 *  @param seconds  The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 *  @param action   A block that will be invoked after the timer fires.
 *  @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 *
 *  @return A new NSTimer object, configured according to the specified parameters.
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats;

/**
 *  Initializes a new NSTimer object using the specified object and selector.
 *  
 *  You must add the new timer to a run loop, using addTimer:forMode:. Upon firing, the timer invokes the action block. (If the timer is configured to repeat, there is no need to subsequently re-add the timer to the run loop.)
 *
 *  @param date The time at which the timer should first fire.
 *  @param seconds  For a repeating timer, this parameter contains the number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 *  @param action   A block that will be invoked after the timer fires.
 *  @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 *
 *  @return The receiver, initialized such that, when added to a run loop, it will fire at date and then, if repeats is YES, every seconds after that.
 */
- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)seconds action:(void(^)(NSTimer *timer))action repeats:(BOOL)repeats;
@end
