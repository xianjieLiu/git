//
//  UIActionSheet+Block.m
//  PPYToolkit
//
//  Created by Hale Chan on 14/11/6.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "UIActionSheet+Block.h"

@interface PPY_ActionSheetDelegate : NSObject <UIActionSheetDelegate>{
    NSMutableArray *_actionSheets;
    NSMutableArray *_clickActions;
}

+ (instancetype)sharedActionSheetDelegate;

- (void)addActionSheet:(UIActionSheet *)actionSheet clickAction:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))action;
- (void)removeActionSheet:(UIActionSheet *)actionSheet;
- (void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))clickActionForActionSheet:(UIActionSheet *)actionSheet;

@end

@implementation PPY_ActionSheetDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _actionSheets = [NSMutableArray array];
        _clickActions = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)sharedActionSheetDelegate
{
    static PPY_ActionSheetDelegate *actionSheetDelegate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!actionSheetDelegate) {
            actionSheetDelegate = [[self alloc]init];
        }
    });
    return actionSheetDelegate;
}

- (void)addActionSheet:(UIActionSheet *)actionSheet clickAction:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))action
{
    NSInteger index = [_actionSheets indexOfObject:actionSheet];
    
    id obj = action;
    if (!obj) {
        obj = [NSNull null];
    }
    
    if (index != NSNotFound) {
        [_clickActions replaceObjectAtIndex:index withObject:obj];
    }
    else {
        [_actionSheets addObject:actionSheet];
        [_clickActions addObject:obj];
    }
    
    if (actionSheet.delegate != self) {
        actionSheet.delegate = self;
    }
}

- (void)removeActionSheet:(UIActionSheet *)actionSheet
{
    NSInteger index = [_actionSheets indexOfObject:actionSheet];
    if (index != NSNotFound) {
        [_actionSheets removeObjectAtIndex:index];
        [_clickActions removeObjectAtIndex:index];
    }
}

- (void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))clickActionForActionSheet:(UIActionSheet *)actionSheet
{
    NSInteger index = [_actionSheets indexOfObject:actionSheet];
    if (index != NSNotFound) {
        id obj = [_clickActions objectAtIndex:index];
        if (![obj isKindOfClass:[NSNull class]]) {
            return obj;
        }
    }
    return nil;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void(^clickAction)(UIActionSheet *actionSheet, NSInteger buttonIndex) = [self clickActionForActionSheet:actionSheet];
    if (clickAction) {
        clickAction(actionSheet, buttonIndex);
    }
    [self removeActionSheet:actionSheet];
}

@end

@implementation UIActionSheet (Block)

+ (instancetype)actionSheetWithTitle:(NSString *)title
                         clickAction:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))action
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title delegate:[PPY_ActionSheetDelegate sharedActionSheetDelegate] cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    
    [[PPY_ActionSheetDelegate sharedActionSheetDelegate] addActionSheet:actionSheet clickAction:action];
    
    va_list ap;
    va_start(ap, otherButtonTitles);
    
    NSString *otherTitle = otherButtonTitles;
    while (otherTitle) {
        [actionSheet addButtonWithTitle:otherTitle];
        otherTitle = va_arg(ap, NSString *);
    }
    
    va_end(ap);
    
    return actionSheet;
}

@end
