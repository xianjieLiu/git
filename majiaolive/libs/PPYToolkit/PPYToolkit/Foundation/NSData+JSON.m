//
//  NSData+JSON.m
//  PPYToolkit
//
//  Created by Hale Chan on 12/3/14.
//  Copyright (c) 2014 com.papayamobile. All rights reserved.
//

#import "NSData+JSON.h"
#import "PPYFoundationToolkit.h"

@implementation NSData (JSON)

- (id)JSONObject
{
    NSError *error = nil;
    id object = nil;
    
    @try {
        object = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
    }
    @catch (NSException *exception) {
        ELog(@"exception : %@,    error : %@", exception, error);
        object = nil;
    }
    @finally {
        return object;
    }
}

+ (instancetype)dataWithJSONObject:(id)object
{
    if (object == nil) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = nil;
    
    @try {
        data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    }
    @catch (NSException *exception) {
        ELog(@"exception : %@,    error : %@", exception, error);
        data = nil;
    }
    @finally {
        return data;
    }
}
@end
