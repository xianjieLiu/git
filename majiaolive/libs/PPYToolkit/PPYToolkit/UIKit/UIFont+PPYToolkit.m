//
//  UIFont+PPYToolkit.m
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Beijing PapayaMobile Inc. All rights reserved.
//

#import "UIFont+PPYToolkit.h"

static NSMutableDictionary *_fontConfiguration;

@implementation UIFont (PPYToolkit)

+ (UIFont *)appFontWithSize:(CGFloat)fontSize
{
    NSString *name = [_fontConfiguration valueForKey:kPPYFontConfigurationKeyNormal];
    if (name.length) {
        return [UIFont fontWithName:name size:fontSize];
    }
    else {
        return [UIFont systemFontOfSize:fontSize];
    }
}

+ (UIFont *)lightAppFontWithSize:(CGFloat)fontSize
{
    NSString *name = [_fontConfiguration valueForKey:kPPYFontConfigurationKeyLight];
    if (name.length) {
        return [UIFont fontWithName:name size:fontSize];
    }
    else {
        return [UIFont systemFontOfSize:fontSize];
    }
}

+ (UIFont *)boldAppFontOfSize:(CGFloat)fontSize
{
    NSString *name = [_fontConfiguration valueForKey:kPPYFontConfigurationKeyBold];
    if (name.length) {
        return [UIFont fontWithName:name size:fontSize];
    }
    else {
        return [UIFont boldSystemFontOfSize:fontSize];
    }
}

+ (UIFont *)italicAppFontOfSize:(CGFloat)fontSize
{
    NSString *name = [_fontConfiguration valueForKey:kPPYFontConfigurationKeyItalic];
    if (name.length) {
        return [UIFont fontWithName:name size:fontSize];
    }
    else {
        return [UIFont italicSystemFontOfSize:fontSize];
    }
}

+ (UIFont *)customFontWithType:(NSString *)type ofSize:(CGFloat)fontSize
{
    NSString *name = [_fontConfiguration valueForKey:type];
    if (name.length) {
        return [UIFont fontWithName:name size:fontSize];
    }
    else {
        return [UIFont italicSystemFontOfSize:fontSize];
    }
}

+ (void)registerFontsConfiguration:(NSDictionary *)config
{
    @synchronized (self) {
        if (!_fontConfiguration) {
            _fontConfiguration = [NSMutableDictionary dictionary];
        }
        else {
            [_fontConfiguration removeAllObjects];
        }
        
        [_fontConfiguration addEntriesFromDictionary:config];
    }
}

@end

NSString *const kPPYFontConfigurationKeyNormal = @"normal";
NSString *const kPPYFontConfigurationKeyLight = @"light";
NSString *const kPPYFontConfigurationKeyBold = @"bold";
NSString *const kPPYFontConfigurationKeyItalic = @"italic";

/*
 HelveticaNeue-BoldItalic,
 HelveticaNeue-Light,
 HelveticaNeue-Italic,
 HelveticaNeue-UltraLightItalic,
 HelveticaNeue-CondensedBold,
 HelveticaNeue-MediumItalic,
 HelveticaNeue-Thin,
 HelveticaNeue-Medium,
 HelveticaNeue-ThinItalic,
 HelveticaNeue-LightItalic,
 HelveticaNeue-UltraLight,
 HelveticaNeue-Bold,
 HelveticaNeue,
 HelveticaNeue-CondensedBlack
 */
