//
//  NSDate+Day.h
//  PPYToolkit
//
//  Created by hale on 14-3-13.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//iOS8对NSCalendarUnit的定义进行了修改，这里隐藏一下该修改
#ifdef __IPHONE_8_0

#define kPPYCalendarUnitEra NSCalendarUnitEra
#define kPPYCalendarUnitYear NSCalendarUnitYear
#define kPPYCalendarUnitMonth NSCalendarUnitMonth
#define kPPYCalendarUnitDay NSCalendarUnitDay
#define kPPYCalendarUnitHour NSCalendarUnitHour
#define kPPYCalendarUnitMinute NSCalendarUnitMinute
#define kPPYCalendarUnitSecond NSCalendarUnitSecond
#define kPPYCalendarUnitWeek NSCalendarUnitWeek
#define kPPYCalendarUnitWeekday NSCalendarUnitWeekday
#define kPPYCalendarUnitWeekdayOrdinal NSCalendarUnitWeekdayOrdinal
#define kPPYCalendarUnitQuarter NSCalendarUnitQuarter
#define kPPYCalendarUnitWeekOfMonth NSCalendarUnitWeekOfMonth
#define kPPYCalendarUnitWeekOfYear NSCalendarUnitWeekOfYear
#define kPPYCalendarUnitYearForWeekOfYear NSCalendarUnitYearForWeekOfYear
#define kPPYCalendarUnitCalendar NSCalendarUnitCalendar
#define kPPYCalendarUnitTimeZone NSCalendarUnitTimeZone

#else

#define kPPYCalendarUnitEra NSEraCalendarUnit
#define kPPYCalendarUnitYear NSYearCalendarUnit
#define kPPYCalendarUnitMonth NSMonthCalendarUnit
#define kPPYCalendarUnitDay NSDayCalendarUnit
#define kPPYCalendarUnitHour NSHourCalendarUnit
#define kPPYCalendarUnitMinute NSMinuteCalendarUnit
#define kPPYCalendarUnitSecond NSSecondCalendarUnit
#define kPPYCalendarUnitWeek NSWeekCalendarUnit
#define kPPYCalendarUnitWeekday NSWeekdayCalendarUnit
#define kPPYCalendarUnitWeekdayOrdinal NSWeekdayOrdinalCalendarUnit
#define kPPYCalendarUnitQuarter NSQuarterCalendarUnit
#define kPPYCalendarUnitWeekOfMonth NSWeekOfMonthCalendarUnit
#define kPPYCalendarUnitWeekOfYear NSWeekOfYearCalendarUnit
#define kPPYCalendarUnitYearForWeekOfYear NSYearForWeekOfYearCalendarUnit
#define kPPYCalendarUnitCalendar NSCalendarCalendarUnit
#define kPPYCalendarUnitTimeZone NSTimeZoneCalendarUnit

#endif

@interface NSDate (Day)

/*!
 *  一天的开始
 *  
 *  @description 	使用当前日历计算一天的开始
 *
 *  @return	当天开始时间
 */
- (NSDate *)beginningOfDay;

- (NSDate *)beginningOfMonth;
- (NSDate *)beginningOfWeek;

/*!
 *  一天的结束
 *
 *  @description 	使用当前日历计算一天的结束时间
 *
 *  @return	当天结束时间
 */
- (NSDate *)endOfDay;

/*!
 *  判断是否是同一天
 *  
 *  @description 	使用当前日历计算是否是同一天，如果传入的day是nil，则会返回NO
 *
 *  @param 	day 	需要比较的天
 *
 *  @return	是否是同一天
 */
- (BOOL)isSameDay:(NSDate *)other;
- (BOOL)isSameWeek:(NSDate *)other;
- (BOOL)isSameMonth:(NSDate *)other;
- (BOOL)isSameYear:(NSDate *)other;

/**
 *  计算与day之前相差的天数
 *
 *  @param day 参考天
 *
 *  @return 如果day的天早于本时间，则返回一个正值，否则返回一个负值
 */
- (NSInteger)daysSinceDay:(NSDate *)day;

/**
 *  Returns an NSComparisonResult value that indicates the temporal ordering of the receiver and another given day
 *
 *  @param anotherDay The date with which to compare the receiver. This value must not be nil
 *
 *  @return if the receiver and anotherDate are same day with each other, NSOrderedSame; if the receiver is later in day than anotherDate, NSOrderedDescending; if the receiver is earlier in day than anotherDate, NSOrderedAscending.
 */
- (NSComparisonResult)compareWithDay:(NSDate *)anotherDay;

/**
 *  两个时间星期的比较
 *
 *  @param date 做比较的时间
 *
 *  @return 比较星期的NSComparisonResult value
 */
- (NSComparisonResult)compareWithWeek:(NSDate *)other;

/**
 *  两个时间月份的比较
 *
 *  @param date 做比较的时间
 *
 *  @return 月份的NSComparisonResult value
 */
- (NSComparisonResult)compareWithMonth:(NSDate *)other;

/*!
 *  天的计算
 *
 *  @description 	天的计算，结果为某天的开始
 *
 *  @param 	days 	负值表示多少天前，正值表示多少天后
 *
 *  @return	返回计算后的天的开始时间
 */
- (NSDate *)dayByAddingDays:(NSInteger)days;

- (NSDate *)dayByAddingMonths:(NSInteger)months;

- (NSDate *)dayByAddingYears:(NSInteger)years;

- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;

/*!
 *  当月的第一天
 *
 *  @notice 	使用当前日历计算当月的第一天，不是每月的1号，在日历里面可能是上个月的29号
 *
 *  @return	每月第一天的时间
 */
- (NSDate *)firstWeekBeginningOfMonth;

- (NSInteger)weekOfMonth;

@end

