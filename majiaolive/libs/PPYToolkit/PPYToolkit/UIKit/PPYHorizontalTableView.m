//
//  PPYHorizontalTableView.m
//  PPYToolkit
//
//  Created by hale on 14-2-12.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "PPYHorizontalTableView.h"

@implementation PPYHorizontalTableView
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setFrame:(CGRect)frame
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.transform = transform;
    
    CGRect rect = CGRectZero;
    rect.size.width = frame.size.height;
    rect.size.height = frame.size.width;
    
    self.bounds = rect;
    self.center = CGPointMake(frame.origin.x+frame.size.width/2.0, frame.origin.y+frame.size.height/2.0);
    
    [self setNeedsLayout];
}

- (void)setRowWidth:(CGFloat)width
{
    self.rowHeight = width;
}

@end
