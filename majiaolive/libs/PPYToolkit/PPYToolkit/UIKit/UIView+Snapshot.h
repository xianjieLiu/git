//
//  UIView+Snapshot.h
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Snapshot)
- (UIImage *)snapshot;
- (UIImage *)snapshotFromRect:(CGRect)rect;
@end

@interface UIScrollView(Snapshot)
- (UIImage *)snapshotWithOffset:(CGPoint)offset;
@end
