//
//  PPYHorizontalTableView.h
//  PPYToolkit
//
//  Created by hale on 14-2-12.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPYHorizontalTableViewCell.h"

/*!
 *  水平滚动列表，需要搭配PPYHorizontalTableViewCell使用
 *  
 *  在下面代理方法中，指定单元的宽，而高实际与表格的高是一样的。
 *  @code
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    return 100.0;//这里指定表格单元的宽度
 }
 *  @endcode
 *  对于定宽的场合，也可以使用[setRowWidth:]方法来设置单元宽度
 */
@interface PPYHorizontalTableView : UITableView

/**
 *  设置单元宽度
 *
 *  本质上设置rowHeight，但从视觉是来说是宽度
 *
 *  @param width 单元的宽度
 */
- (void)setRowWidth:(CGFloat)width;

@end
