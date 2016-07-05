//
//  NSDictionary+DefaultValue.h
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DefaultValue)
- (int)intValueForKey:(id)key;
- (int)intValueForKey:(id)key defaultValue:(int)defaultValue;
- (int)intValueForInt:(int)key;
- (int)intValueForInt:(int)key defaultValue:(int)defaultValue;
- (id)objectForInt:(int)key;
- (id)objectForInt:(int)key defaultValue:(id)defaultValue;
- (id)objectForKey:(id)aKey defaultValue:(id)defaultValue;
- (NSDate *)dateForKey:(id)aKey;
- (BOOL)boolValueForKey:(id)aKey;
- (NSString *)stringValueForKey:(id)key;
- (NSArray *)orderedKeys;
- (NSArray *)orderedValues;
- (NSArray *)orderedValuesForOrderedKeys:(NSArray*)keys;
@end
