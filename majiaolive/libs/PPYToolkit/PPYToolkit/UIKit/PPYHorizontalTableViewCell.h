//
//  PPYHorizontalTableViewCell.h
//  PPYToolkit
//
//  Created by hale on 14-2-12.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  水平滚动表格单元，主要是搭配PPYHorizontalTableView使用
 */
@interface PPYHorizontalTableViewCell : UITableViewCell

/**
 *  任意数据，但不可以是cell视图树内的对象，以避免retain-cycle，通常用于存放一些该cell相关的数据
 */
@property (nonatomic, strong)id userInfo;
@end
