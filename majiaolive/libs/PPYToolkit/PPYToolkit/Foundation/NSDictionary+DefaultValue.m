//
//  NSDictionary+DefaultValue.m
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import "NSDictionary+DefaultValue.h"

@implementation NSDictionary (DefaultValue)
- (int)intValueForKey:(id)key
{
    return [self intValueForKey:key defaultValue:-1];
}

- (int)intValueForKey:(id)key defaultValue:(int)defaultValue
{
    id obj = self[key];
    if (obj && [obj respondsToSelector:@selector(intValue)])
        return [obj intValue];
    else
        return defaultValue;
}

- (int)intValueForInt:(int)key {
    return [self intValueForInt:key defaultValue:-1];
}

- (int)intValueForInt:(int)key defaultValue:(int)defaultValue {
    return [self intValueForKey:@(key) defaultValue:defaultValue];
}

- (id)objectForInt:(int)key {
    return self[@(key)];
}

- (id)objectForInt:(int)key defaultValue:(id)defaultValue {
    id obj = [self objectForInt:key];
    if (obj)
        return obj;
    else
        return defaultValue;
}

- (id)objectForKey:(id)aKey defaultValue:(id)defaultValue {
    id obj = self[aKey];
    if (obj && ![obj isKindOfClass:[NSNull class]])
        return obj;
    else
        return defaultValue;
}

- (NSDate *)dateForKey:(id)aKey {
    id obj = self[aKey];
    if (obj && [obj respondsToSelector:@selector(doubleValue)]) {
        NSTimeInterval timeInterval = [obj doubleValue] ;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        return date;
    }
    else {
        return nil;
    }
}

- (BOOL)boolValueForKey:(id)aKey {
    return [self intValueForKey:aKey defaultValue:0] == 0 ? NO : YES;
}

- (NSString *)stringValueForKey:(id)key {
    id obj = self[key];
    if ([obj isKindOfClass:[NSString class]])
        return obj;
    else if ([obj isKindOfClass:[NSNumber class]])
        return [obj stringValue];
    else
        return nil;
}

- (NSArray *)orderedKeys {
    return [self allKeys];
}

- (NSArray *)orderedValues {
    NSArray *keys = [self orderedKeys];
    return [self orderedValuesForOrderedKeys:keys];
}

- (NSArray *)orderedValuesForOrderedKeys:(NSArray*)keys{
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:[keys count]];
    for (id key in keys) {
        id value = self[key];
        if(value)
            [values addObject:value];
        else
            [values addObject:[NSNull null]];
    }
    return values;
}
@end
