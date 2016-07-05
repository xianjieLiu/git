//
//  PPYPerformanceProfiler.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/2/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

@class NSString;

/**
 *  代码块运行时间分析
 *
 *  @param title  日志中表示该代码的说明文字
 *  @param ^block 需要分析的代码块
 *
 *  @return 执行该代码块花费的时间，单位为秒(s)
 */
double PPYRunningCostProfile(NSString *title, void(^block)());
