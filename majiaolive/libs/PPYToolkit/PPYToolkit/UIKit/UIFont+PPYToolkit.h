//
//  UIFont+PPYToolkit.h
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (PPYToolkit)

/**
 *  App默认字体
 *
 *  @param fontSize 字体大小
 *
 *  @return 指定大小的App默认字体
 */
+ (UIFont *)appFontWithSize:(CGFloat)fontSize;

/**
 *  App默认的细字体
 *
 *  @param fontSize 字体大小
 *
 *  @return 指定大小的细字体
 */
+ (UIFont *)lightAppFontWithSize:(CGFloat)fontSize;

/**
 *  App默认的粗字体
 *
 *  @param fontSize 字体大小
 *
 *  @return 指定大小的粗字体
 */
+ (UIFont *)boldAppFontOfSize:(CGFloat)fontSize;

/**
 *  App默认的斜字体
 *
 *  @param fontSize 字体大小
 *
 *  @return 指定大小的斜字体
 */
+ (UIFont *)italicAppFontOfSize:(CGFloat)fontSize;

/**
 *  自定义用途的字体查询
 *
 *  @notice
 *  如果使用字体配置表中没有type记录，则会返回系统默认字体
 *
 *  @param type     注册的字体用途类型
 *  @param fontSize 字体大小
 *
 *  @return 一个字体实例
 */
+ (UIFont *)customFontWithType:(NSString *)type ofSize:(CGFloat)fontSize;

/**
 *  注册应用字体方案
 *
 *  @param config 字体方案信息，kPPYFontConfigurationKey*为默认的key。<br />
 *  也可以使用其它key用作自定义用途，但不可以与kPPYFontConfigurationKey*冲突
 */
+ (void)registerFontsConfiguration:(NSDictionary *)config;
@end

extern NSString *const kPPYFontConfigurationKeyNormal;
extern NSString *const kPPYFontConfigurationKeyLight;
extern NSString *const kPPYFontConfigurationKeyBold;
extern NSString *const kPPYFontConfigurationKeyItalic;
