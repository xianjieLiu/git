//
//  PPYHorizontalTableViewCell.m
//  PPYToolkit
//
//  Created by hale on 14-2-12.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "PPYHorizontalTableViewCell.h"

@implementation PPYHorizontalTableViewCell

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
    self.transform = transform;
    
    CGRect rect = CGRectZero;
    rect.size.width = frame.size.height;
    rect.size.height = frame.size.width;
    
    self.bounds = rect;
    self.center = CGPointMake(frame.origin.x+frame.size.width/2.0, frame.origin.y+frame.size.height/2.0);
    
    [self setNeedsLayout];
}

@end
