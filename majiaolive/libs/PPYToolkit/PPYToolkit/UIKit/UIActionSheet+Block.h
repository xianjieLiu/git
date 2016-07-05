//
//  UIActionSheet+Block.h
//  PPYToolkit
//
//  Created by Hale Chan on 14/11/6.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIActionSheet (Block)

+ (instancetype)actionSheetWithTitle:(NSString *)title
                         clickAction:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))action
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
